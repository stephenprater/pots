class AutocompleteAssociationInput < SimpleForm::Inputs::CollectionInput
  enable :placeholder
  
  def input
    raise ArgumentError, "Autocomplete only works with associations" if reflection.nil?

    @field    = options.delete(:autocomplete_on) || "value"
    @editable = !!(options.delete(:editable))

    association_name = reflection.name
    
    output = String.new.html_safe

    # list any existing associations
    @builder.simple_fields_for association_name do |f| 
      output << f.hidden_field(:id)
      output << f.input(@field, :disabled => true, :wrapper => custom_wrapper, :input_html => input_html_options)
    end

    tag_options = { 
      :"autocomplete" => "off",
      :"data-autocomplete" => 'typeahead',
      :"data-source" => "#{association_name}",
    }
    output.concat(template.text_field_tag("search_#{association_name}", nil, input_html_options.merge(tag_options)))

    template.instance_exec @field, collection.to_a do |field, collection_array|
      @autocompletes ||= {}
      @autocompletes[association_name] = collection_array.collect { |i| {:id => i.id, :name => i.send(field.to_sym)} }
    end

    output
  end

  def custom_wrapper
    SimpleForm.build :tag => :div, :class => ["collection-list", "input-append","control-group"] do |b|
      b.use :input
      b.use :destroy
    end
  end
end

module SimpleForm::Components::Destroy
  def destroy
    output = String.new.html_safe
    output += "<span class='add-on'><a href='#' class='destroy'><i class='icon-trash'></i></a></span>".html_safe
    output += template.hidden_field_tag(object_name + '[_destroy]', false, :class => '_destroy')
  end
end

SimpleForm::Inputs::Base.send(:include, SimpleForm::Components::Destroy)
