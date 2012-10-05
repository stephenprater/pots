require 'delegate'
require 'set'

if Rails.env.development?
  Object.send(:remove_const, :ControllerAssociationStore) rescue true
end

module ProvidesAssociation
  extend ActiveSupport::Concern
  module ClassMethods
    def associations
      ControllerAssociationStore.instance
    end

    def associates_with reflection, opts = {}
      Rails.logger.debug 'creating parent association'
      klass = controller_name.classify.constantize
      refl = klass.reflect_on_association reflection
      
      parent_associates_with refl, opts
    end

    def provides_association_to reflection, opts = {}
      Rails.logger.debug 'creating child association'
      unless self.respond_to? :associate
        self.send(:include, ::ProvidesAssociation::Actions)
      end
      klass = controller_name.classify.constantize
      refl = klass.reflect_on_association reflection
      
      child_associates_with refl, opts
    end

    def update_association parent, reflection, opt
      assoc = ControllerAssociation.new(parent, reflection, opt)
      unless associations << assoc
        associations[assoc].merge(assoc)
      end
      binding.pry
      associations[assoc]
    end

    def interrogate_associations query 
      associations.select do |assoc|
        query.keys do |k|
          query[k] === assoc.send(k) and next or break false
        end and true
      end
    end

    private
    def parent_associates_with reflection, opt = {}
      options = opt.slice :reflection, :child_class, :parent_class, :field_name, :name, :through

      if options.keys != opt.keys
        Rails.logger.warn "WARNING: Invalid keys #{opt.keys - options.keys} specified in parent controller"
      end

      assoc = update_association(reflection.active_record, reflection, options)

      if opt[:through]
        parent = self.interrogate_associations :name => opt[:through]
        if parent.blank?
          raise ProvidesAssociation::NoParentAssociation, 
            "Couldn't find through association #{parent_assoc.name} for #{assoc.name}"
        end
        assoc.parent = parent
      end
    end
    
    def child_associates_with reflection, opt = {}
      options = opt.slice :path, :edit, :show, :new, :layout, :route

      if options.keys != opt.keys
        Rails.logger.warn "WARNING: Invalid keys #{opt.keys - options.keys} specified in child controller"
      end
      
      update_association(reflection.klass, reflection, options)

      if action = opt.delete(:route)
        self.alias_method action, :associate
        self.undef_method :associate
      end
    end
  end

  module Actions
    extend ActiveSupport::Concern

    included do |target|
      target.respond_to :js, :only => :associate
      helper_method :association
    end
      
    def associate
      # add the parent class view paths to the lookup context
      association = self.class.associations.select do |s|
        s.key_for =~ request.path
      end
      
      while p = association.parent
        lookup_context.prefixes.unshift(p.path)
      end
      field = request.query_parameters.delete :field
      
      
      if params[:id] == "0" || params[:id] == "new"
        child = quiet_sanitizer(association.child_class.new) do |obj|
          sanitized_params = obj.send(:sanitize_for_mass_assignment, request.query_parameters) 
          sanitized_params.each do |param, value|
            obj.send("#{param}=", value)
          end
        end
        @association = ParticularAssociation.new(assoc, field, child)
       
        binding.pry
        respond_with @association
      else
        @child = child_class.find(params[:id])
        respond_with @child
      end
    end
  end
end

class ControllerAssociation
  attr_accessor  :parent_class, :child_class, :path, :name, :reflection, 
    :field_name, :edit_partial, :new_partial, :show_partial, :layout

  attr_accessor  :parent
  
  cattr_accessor :compared_values
  
  self.compared_values ||= [ :parent_class, :child_class, :path, :name, :reflection, 
   :field_name, :edit_partial, :show_partial, :new_partial, :layout ]

  def initialize parent, reflection, options = {}
    child = if reflection.active_record == parent
      reflection.klass
    else
      reflection.active_record
    end

    self.parent_class = parent
    self.child_class  = child
    self.name         = reflection.name
    self.reflection   = reflection
    self.path         = options[:path]         || [parent_class.model_name.plural, child_class.model_name.singular].join("/"),
    self.field_name   = options[:field_name]   || "search_#{reflection.name}",
    self.edit_partial = options[:edit]         || "edit",
    self.show_partial = options[:show]         || "show",
    self.new_partial  = options[:new]          || "new"
    self.layout       = options[:layout]       || "associate"
  end

  def association child, field
    ParticularAssociation.new(self, child, field)
  end

  def child_index
    SecureRandom.uuid #or counted index
  end

  def key_for
    return @synthetic_key if @synthetic_key
    
    ancestors = []
    p = self 
    while p = p.parent
      ancestors.push p
    end
    @synthetic_key = [ancestors,hash_key].flatten.join("/")
  end

  def hash_key
    #should use the reflection name here and not the
    #the classnames
    pk = self.parent_class.model_name.singular
    ck = if self.reflection.collection?
      self.child_class.model_name.plural
    else
      self.child_class.model_name.singular
    end
    [pk, ck]
  end

  def hash
    hash_key.join("/").hash
  end

  def - other
     @@cmp_values.each_with_object({}) do |o, memo|
      unless (a = self.send(o)) == (b = other.send(o))
        memo[o] = [a, b]
      end
     end
  end

  def merge other
    @@cmp_values.each do |m|
      if o = other.send(m)
        self.send("#{m}=", o)
      end
    end
  end

  def action action
    self.send("#{action}_partial")
  end
end

class ParticularAssociation < DelegateClass(ControllerAssociation)
  attr_accessor :field, :child
  def initialize assoc, field, child
    super(assoc)
    @field = field
    @child = child
  end

  def field_id
    @field_id ||= @field.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
  end
end

class ControllerAssociationStore
  include Enumerable
  include Singleton

  class QuasiSet < Set
    def add(o)
      @hash[o] = o
      o
    end

    def get(o)
      @hash[o]
    end
  end

  cattr_accessor :associations, :mutex

  self.associations = QuasiSet.new
  self.mutex = Mutex.new
  
  # returns nil if the association already exists
  def << assoc
    mutex.synchronize do
      associations.add? assoc
    end
  end

  def [] assoc
    associations.get(assoc)
  end

  def each &block
    associations.each do |v|
      yield v
    end
  end
end
