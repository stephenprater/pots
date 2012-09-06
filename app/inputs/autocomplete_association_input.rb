class AutocompleteAssociationInput < SimpleForm::Inputs::CollectionInput
  enable :placeholder
  
  def input
    raise ArgumentError, "Autocomplete only works with associations" if reflection.nil?

    @url     = options.delete :url
    @field   = options.delete :autocomplete_on || "value"

    association_class = reflection.klass
    association_name = reflection.name
    
    if not @url
      @url = template.url_for([:autocomplete, \
        [association_class.to_s.underscore, @field].compact.join("_"), \
         association_class])
    end

    output = String.new.html_safe
    
    if reflection.collection?
      object.send(association_name).empty? and object.send(association_name).new
    else
      object.send("#{association_name}=", (object.send(association_name) || association_class.new))
    end
    
    @builder.simple_fields_for association_name do |f|
      unless f.object.new_record?
        output += super
        output += f.hidden_field :id
        output += f.check_box_field :_delete
      else
        output += f.hidden_field :id 
        id_element = "#" + output.match(/id="(.*?)"/)[1]
        tag_options = { 
          :"data-autocomplete" => @url,
          :"data-id-element" => id_element,
          :"data-association" => association_name
        }
        
        output += template.text_field_tag("search_#{association_name}", nil, input_html_options.merge(tag_options))
      end
    end

    output
  end
end
