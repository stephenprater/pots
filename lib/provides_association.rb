module ProvidesAssociation
  extend ActiveSupport::Concern

  include ActionView::Helpers::FormHelper

  included do |target|
    target.respond_to :js, :only => :associate
    helper_method :multi_nested_fields
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
  
    @parents_obj = []
    parents.each do |k,v|
      lookup_context.prefixes.unshift v[:view_prefix]
      @parents_obj << v[:klass]
    end

    @field = request.query_parameters.delete :field
    @child_index = SecureRandom.uuid
    @partial_name = child_klass.model_name.singular

    if params[:id] == "0" || params[:id] == "new"
      @child = quiet_sanitizer child_klass.new do |obj|
        sanitized_params = obj.send(:sanitize_for_mass_assignment, request.query_parameters) 
        sanitized_params.each do |param, value|
          obj.send("#{param}=", value)
        end
      end
      render :new, :formats => [:js]
    else
      @child = child_klass.find(params[:id])
      respond_with @child
    end
  end

  private
  def multi_nested_fields f = self 
    fields_for @parents_obj.shift.new do |g|
      if @parents_obj.length > 0
        multi_nested_fields g
      else
        yield g
      end
    end
  end
end
