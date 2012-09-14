class LookupAttributesController < ApplicationController
  respond_to :js

  def autocomplete
    results = lookup_type.select(:value).select(:id).where {
      (value.matches "%#{term}%")
    }.limit(10)
    results.collect do |r|
      {:id => r.id, :label => r.value}
    end
    render :json => results
  end

  def new
    sanitized_params = {}
    @lookup_attribute = quiet_sanitizer lookup_type.new do |obj|
      sanitized_params = obj.send(:sanitize_for_mass_assignment,params)
      obj.update_attributes(sanitized_params)
    end
    
    @inputs = sanitized_params.keys
    @vessell = params[:id] == "0" ? Vessell.new : Vessell.find(params[:id])
  end

  def associate
    @lookup_attribute = lookup_type.find(params[:id])
    @vessell = params[:vessell_id] == 0 ? Vessell.new : Vessell.find(params[:vessell_id])
    #find the reflection that uses this type - i think this should be abstracted
    ref_name = @vessell.reflections[lookup_type.name.pluralize.underscore.to_sym].name
    @vessell.send(ref_name) << @lookup_attribute
  end

  private
  def lookup_type
    klass = params[:type].camelize.constantize
    unless klass < controller_name.classify.constantize
      raise ArgumentError, "not a valid lookup"
    end
    klass
  end
end
