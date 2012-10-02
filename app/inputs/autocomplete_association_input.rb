class AutocompleteAssociationInput < SimpleForm::Inputs::CollectionInput
  enable :placeholder
  
  def input
    raise ArgumentError, "Autocomplete only works with associations" if reflection.nil?

    field    = options.delete(:autocomplete) || "value"

    association_name = reflection.name
    
    associate_callback = options.delete(:associate) || associate_route
    new_callback = options.delete(:new) || new_route 
    association_template = options.delete(:template) || association_name

    
    output = String.new.html_safe

    # list any existing associations
    @builder.simple_fields_for association_name do |f| 
      template.render association_template, :f => f
    end

    if reflection.collection? || !object.send(association_name)
      tag_options = { 
        :"autocomplete" => "off",
        :"data-association" => association_name,
        :"data-new-callback" => new_callback,
        :"data-autocomplete" => autocomplete_route(field),
        :"data-associate-callback" => associate_callback,
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
    controller = ActiveModel::Naming.route_key(object)
    id = object.id || 0
    association = ActiveModel::Naming.singular_route_key(reflection.klass)
    [controller, id, association]
  end

  def autocomplete_route field 
    controller = ActiveModel::Naming.route_key(reflection.klass)
    singular = ActiveModel::Naming.singular_route_key(reflection.klass)
    autocomplete_method = "autocomplete_#{singular}_#{field}"
    "/" + [controller, autocomplete_method].join("/")
  end

  def new_route
    if reflection.collection?
      "/" + ((base_route << 'new').join("/"))
    else
      controller = ActiveModel::Naming.route_key(reflection.klass)
      "/" + [controller, 'new'].join("/")
    end
  end

  def associate_route
    "/" + (base_route << 'associate').join('/')
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
