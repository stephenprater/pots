class AutocompleteAssociationInput < SimpleForm::Inputs::CollectionInput
  enable :placeholder
  
  def input
    raise ArgumentError, "Autocomplete only works with associations" if reflection.nil?

    field                = options.delete(:autocomplete) || "value"
    association_name     = reflection.name
    association_callback = options.delete(:associate) || callback_route
    association_template = options.delete(:template) || association_name
    output               = String.new.html_safe

    # list any existing associations, useing the provided partial
    # falling back to the name of the association
    output.concat @builder.simple_fields_for association_name do |f| 
      template.render association_template, :f => f
    end

    form_field = ActionView::Helpers::InstanceTag.new(object_name, association_name, nil, object).send(:tag_name)

    association_data = {
      :name         => association_name,
      :autocomplete => autocomplete_route(field),
      :callback     => association_callback,
      :field        => form_field
    }

    if reflection.collection? || !object.send(association_name)
      tag_options = { 
        :"autocomplete"     => "off",
        :"data-association" => association_data.to_json
      }
      output.concat(template.text_field_tag("search_#{association_name}", nil, input_html_options.merge(tag_options)))
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
  def base_route
        [controller, id, association]
  end

  def autocomplete_route field 
    controller = reflection.klass.model_name.route_key
    singular = reflection.klass.model_name.singular_route_key
    autocomplete_method = "autocomplete_#{singular}_#{field}"
    "/" + [controller, autocomplete_method].join("/")
  end

  def callback_route
    parent = object.class.model_name.route_key
    id = object.id || 0
    unless reflection.collection? 
      association = reflection.klass.model_name.singular_route_key
      "/" + ([parent, id, association, 'associate', '#{association_id}']).join('/')
    else
      association = reflection.klass.model_name.route_key
      "/" + ([parent, id, association, '#{association_id}', 'associate']).join('/')
    end
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
