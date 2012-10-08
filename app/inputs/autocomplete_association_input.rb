class AutocompleteAssociationInput < SimpleForm::Inputs::CollectionInput
  enable :placeholder

  attr_accessor :association_controller
  
  def input
    raise ArgumentError, "Autocomplete only works with associations" if reflection.nil?

    @association_controller = options.delete(:controller) || (reflection.klass.model_name.plural + '_controller').classify.constantize
    field                   = options.delete(:autocomplete) || "value"
    association_name        = reflection.name
    association_callback    = options.delete(:associate) || callback_route
    editable                = options.delete(:editable) || false
    fields_wrapper          = options.delete(:fields_wrapper) || @builder.options[:wrapper]
    output                  = String.new.html_safe

    begin
      controller_association  = association_controller.interrogate_associations(:name => association_name)
      binding.pry
    rescue NoMethodError => e
      e.message "Couldn't interrogate the association, did you add it to the controller?"
    end

    # list any existing associations, useing the provided partial
    # falling back to the name of the association
    form_field =  ""

    if @builder.object.send(association_name).blank?
      @builder.simple_fields_for association_name, reflection.klass.new do |f|
        form_field = f.object_name
      end
      output.concat(
        template.content_tag(:div, nil,  
                             :id    => form_field.gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, ""),
                             :style => 'margin:0;padding:0;display:inline'))
    else
      output.concat @builder.simple_fields_for association_name do |f| 
        form_field = f.object_name
        template_name = editable ? controller_association.edit : controller_association.show
        template.render(template_name, :f => f)
      end
    end

    association_data = {
      :name         => association_name,
      :autocomplete => autocomplete_route(field),
      :callback     => association_callback,
      :field        => form_field,
    }

    if reflection.collection? || !object.send(association_name)
      tag_options = { 
        :"autocomplete"     => "off",
        :"data-association" => association_data.to_json
      }
      output.concat(template.text_field_tag(controller_association.field_name, nil, input_html_options.merge(tag_options)))
    end

    output
  end

  def custom_wrapper
    SimpleForm.build :tag => :div, :class => ["collection-list", "input-append","control-group"] do |b|
      b.use :input
      b.use :destroy
    end
  end

  private

  def autocomplete_route field 
    controller = association_controller.controller_name
    singular = reflection.klass.model_name.singular_route_key
    autocomplete_method = "autocomplete_#{singular}_#{field}"
    "/" + [controller, autocomplete_method].join("/")
  end

  def callback_route
    parent = object.class.model_name.route_key
    id = object.id || 0
    unless reflection.collection? 
      association = association_controller.controller_name.singularize
      "/" + ([parent, id, association, 'associate', '#{association_id}']).join('/')
    else
      association = association_controller.controller_name.pluralize
      "/" + ([parent, id, association, '#{association_id}', 'associate']).join('/')
    end
  end
end

module FieldNameAccess
   def field_id(builder, attribute)
    "#{builder.object_name}[#{attribute.to_s.sub(/\?$/,"")}]".gsub(/\]\[|[^-a-zA-Z0-9:.]/, "_").sub(/_$/, "")
   end

   def field_name(builder, attribute)
     "#{builder.object_name}[#{attribute.to_s.sub(/\?$/,"")}]"
   end 
end

module SimpleForm::Components::Destroy
  def destroy
    output = String.new.html_safe
    output += "<span class='add-on'><a href='#' data-destroy='#{object_name + '[_destroy]'}'><i class='icon-trash'></i></a></span>".html_safe
    output += template.hidden_field_tag(object_name + '[_destroy]', false, :class => '_destroy')
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Destroy)
