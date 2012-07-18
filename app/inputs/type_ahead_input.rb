class TypeAheadInput < SimpleForm::Inputs::StringInput
  def input
    value = object.send(attribute_name) if object.respond_to? attribute_name
    input_html_classes << "typeahead"

    super
  end
end
