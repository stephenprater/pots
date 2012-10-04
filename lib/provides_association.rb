module ProvidesAssociation
  extend ActiveSupport::Concern

  included do |target|
    target.respond_to :js, :only => :associate
    @default_child_class = controller_name.classify.constantize
    helper_method :associated
  end
  
  module ClassMethods
    attr_reader :associations
    attr_reader :default_child_class

    def associates_with *model
      Rails.logger.debug 'reloaded controller, erasing template information'
      @associations ||= {}
      if model.length == 1 && model[0].is_a?(Hash)
        model = model[0]
      end
      
      model.each do |(m, opt)|
        opt ||= {}
        unless m.class.instance_methods.include? :to_model
          m = m.to_s.classify.constantize
        end

        child_class = default_child_class || opt[:child_class]
        reflection = lookup_reflection(m, child_class)

        associations[m.model_name.param_key + "_id"] = opt.reverse_merge({
          :parent_class => m,
          :child_class  => child_class,
          :path         => [m.model_name.plural, child_class.model_name.singular].join("/"),
          :name         => reflection.collection? ? child_class.model_name.plural : child_class.model_name.singular,
          :reflection   => reflection,
          :field_name   => "search_#{reflection.name}",
          :edit_partial => "form",
          :partial      => "show",
          :layout       => reflection.name 
        })
      end 
    end

    def interrogate_associations query 
      associations.dup.delete_if do |key, val|
        val != query[key]
      end
    end

    private
    def lookup_reflection klass, child_class = default_child_class
      refl = klass.reflections.select do |k,v|
        (v.klass == child_class) rescue false
      end
      
      if refl.keys.length > 1
        raise ::ActiveRecord::ActiveRecordError, 
          "Multiple associations to #{child_class.model_name}, please specify the association"
      end

      refl.values[0] 
    end
  end

  def associate
    # add the parent class view paths to the lookup context
    last_parent = nil 
    self.class.associations.slice(
      *(params.keys & self.class.associations.keys)).each do |key, parent|
        lookup_context.prefixes.unshift(parent[:path])
        last_parent = parent
      end
   
    @field          = request.query_parameters.delete :field
    @field_id       = @field.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
    @child_index    = SecureRandom.uuid
    @reflection     = last_parent[:reflection]
    @field_name     = last_parent[:field_name]
    child_class     = last_parent[:child_class]
        
    if params[:id] == "0" || params[:id] == "new"
      @partial_name = last_parent[:edit_partial]

      @child = quiet_sanitizer child_class.new do |obj|
        sanitized_params = obj.send(:sanitize_for_mass_assignment, request.query_parameters) 
        sanitized_params.each do |param, value|
          obj.send("#{param}=", value)
        end
      end
      render @partial_name, :layout => last_parent[:layout].to_s
    else
      @child = child_class.find(params[:id])
      respond_with @child
    end
  end

  private
  def associated(fb = nil)
    binding.pry
    if fb && block_given?
      @builder = fb 
      yield
      @builder = nil
    else
      @builder
    end
  end

end
