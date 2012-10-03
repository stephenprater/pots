module ProvidesAssociation
  extend ActiveSupport::Concern

  included do |target|
    target.respond_to :js, :only => :associate
  end
  
  module ClassMethods
    attr_reader :parent_parameters

    def associates_with *model
      @parent_parameters ||= {} 
      model.each do |m|
        unless m.class < ActiveRecord::Base
          m = m.to_s.classify.constantize
        end
        parent_parameters[m.model_name.param_key  + "_id"] = {
          :klass => m,
          :view_prefix => m.model_name.plural
        } 
      end
    end
  end

  def associate
    child_klass = controller_name.classify.constantize
  
    parents = self.class.parent_parameters.slice(*(params.keys & self.class.parent_parameters.keys))

    @parent_objects = []
    parents.each do |key, value|
      lookup_context.prefixes.unshift value[:view_prefix]
      @parent_objects << value[:klass]
    end

    @field = request.query_parameters.delete :field
    @child_index = SecureRandom.uuid

    if params[:id] == "0" || params[:id] == "new"
      @child = quiet_sanitizer child_klass.new do |obj|
        sanitized_params = obj.send(:sanitize_for_mass_assignment, request.query_parameters) 
        sanitized_params.each do |param, value|
          obj.send("#{param}=", value)
        end
      end
      respond_with @child 
    else
      @child = child_klass.find(params[:id])
      respond_with @child
    end
  end
end
