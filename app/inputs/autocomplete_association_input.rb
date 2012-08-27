class AutocompleteAssociationInput < SimpleForm::Inputs::AutocompleteInput
  def input

    binding.pry

    association = object.class.reflect_on_association(attribute_name)
    association_base_url = association.class_name.underscore
    auto_complete_field = options.fetch(:autocomplete_on,"value")

    auto_complete_path = template.url_for([:autocomplete, \
      [association_base_url, options.fetch(:autocomplete_on,nil)].join("_"), \
       association_base_url.pluralize])

    assoc_object = object.send(attribute_name) || association.class_name.constantize.send(:new)

    output = String.new.html_safe

    @builder.fields_for [object, assoc_object] do |f|
      if !f.object.new_record?
        output += f.text_field auto_complete_field, :disabled => true
        output += f.hidden_field :id
        output += f.check_box_field :_delete
      else
        #how do i get the name of that field?
        output += f.hidden_field :id 
        id_element = output.match(/id=".*?"/)[1]
        output += template.text_field_tag "search_#{attribute_name}", {
          :"data-autocomplete" => auto_complete_path,
          :"data-id-element" => id_element,
        }
      end
    end
    
    output
  end
end
