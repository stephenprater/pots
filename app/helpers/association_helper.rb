module AssociationHelper
  def associated_fields options
    binding.pry
    form = String.new.html_safe
    form = capture do
      simple_fields_for association.field, association.child, {:index => association.child_index}.merge(options) do |f|
        form.concat yield f
      end
    end
  end

  module RenderChild
    def render_child
      
      
    end
  end
end
