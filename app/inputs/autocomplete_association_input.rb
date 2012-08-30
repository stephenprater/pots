class AutocompleteAssociationInput < SimpleForm::Inputs::CollectionInput
  def input

    association_class = reflection.class_name.constantize
    method = reflection.name
    
    autocomplete_field = options[:autocomplete_on] || "value"
    if not options[:url]
      auto_complete_path = template.url_for([:autocomplete, \
        [association_class.to_s.underscore, autocomplete_field].compact.join("_"), \
         association_class])
    else
      auto_complete_path = options[:url]
    end

    options.delete :url
    options.delete :as
    options.delete :autocomplete_on
    
    output = String.new.html_safe
    
    fields_body = lambda do |f|
      unless f.object.new_record?
        output += super
        output += f.hidden_field :id
        output += f.check_box_field :_delete
      else
        #how do i get the name of that field?
        output += f.hidden_field :id 
        id_element = output.match(/id="(.*?)"/)[1]
        options.reverse_merge!({
          :"data-autocomplete" => auto_complete_path,
          :"data-id-element" => id_element,
          :"data-association" => attribute_name})

        tag_options =  {}
        tag_options = options.merge(input_html_options)

        output += template.text_field_tag "search_#{attribute_name}", nil, tag_options
      end
    end
 
    if association.collection?
      assoc_objects = object.send(method)
      if assoc_object.empty?
        object.send(method).new
        object.send(method)
      end
      @builder.simple_fields_for attribute_name, &fields_body
    else
      assoc_object = object.send(attribute_name) || association_class.new
      @builder.simple_fields_for assoc_object, &fields_body
    end

    output
  end
end
