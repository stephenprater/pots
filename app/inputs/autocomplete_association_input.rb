class AutocompleteAssociationInput < SimpleForm::Inputs::CollectionInput
  enable :placeholder
  
  def input
    raise ArgumentError, "Autocomplete only works with associations" if reflection.nil?

    @url     = options.delete :url
    @field   = options.delete(:autocomplete_on) || "value"

    association_class = reflection.klass
    association_name = reflection.name
    
    if not @url
      @url = template.url_for([:autocomplete, \
        [association_class.to_s.underscore, @field].compact.join("_"), \
         association_class])
    end

    output = String.new.html_safe

    # create the template fields
    @builder.simple_fields_for association_name do |f|
      output << f.hidden_field(:id, input_html_options.merge(
        :value => nil, :id => '#{association_name}_id_template'))
      id_element = "#" + output.match(/id="(.*?)"/)[1]
      output << f.text_field(@field, input_html_options.merge(
        :value => nil, :type => 'hidden', :id => "#{association_name}_template"))
      
      tag_options = { 
        :"autocomplete" => "off",
        :"data-autocomplete" => 'typeahead',
        :"data-source" => "#{association_name}",
        :"data-id-element" => id_element,
      }
      output << template.text_field_tag("search_#{association_name}", nil, input_html_options.merge(tag_options))
    end

    binding.pry
     @builder.simple_fields_for association_name do |f|
     f.input :id
     f.check_box_field :_delete
     f.input @field
    end

    collection_array = collection.to_a

    template.instance_exec @field do |field|
      @autocompletes ||= {}
      @autocompletes[association_name] = collection_array.collect { |i| {:id => i.id, :name => i.send(field.to_sym)} }
    end
    output
  end
end
