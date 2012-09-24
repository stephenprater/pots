class TagInput < SimpleForm::Inputs::StringInput
  enable :placeholder

  def input
    output = String.new.html_safe
    output << @builder.hidden_field(:"#{attribute_name.to_s.singularize}_list")
    input_html_options[:'data-tag'] ||= attribute_name
    output.concat(template.text_field_tag("tag_#{attribute_name}", nil, input_html_options))

    output
  end
end
