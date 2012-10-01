class TagInput < SimpleForm::Inputs::StringInput
  enable :placeholder

  def input
    output = String.new.html_safe

    ul_options = input_html_options.merge(
      { :"data-tag" => "#{@builder.object_name}[#{attribute_name}][]",
        :"data-tag-input" => "#tag_#{attribute_name}",
        :"data-tag-source" => "#{attribute_name}"})
    
    output = template.content_tag(:ul, ul_options) do
      object.send("#{attribute_name}").collect do |tag|
        template.content_tag(:li, tag)
      end.join("")
    end
    output.concat(template.text_field_tag("tag_#{attribute_name}", nil, input_html_options))

    # create a script tag at the end of the document for the autocomplete data
    # ajax is too slow for this
    template.instance_exec attribute_name do |context|
      @autocompletes ||= {}
      @autocompletes[context] = ActsAsTaggableOn::Tag.joins { taggings }.where { taggings.context == context.to_s }.collect { |i| i.name }
    end

    output
  end
end
