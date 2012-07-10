class RemoteLinkRenderer < WillPaginate::ViewHelpers::LinkRenderer
  def link text, target, attributes = {}
    attributes[:"data-remote"] = true
    super
  end

  def page_number(page)
    if page == current_page
      @template.content_tag :li, :class => 'active' do
        link(page, page, :class => 'current').html_safe
      end
    else
      @template.content_tag :li do
        link(page, page, :rel => rel_value(page)).html_safe
      end
    end
  end

  def url target
    param = @options[:param_name].to_s
    path = @options[:href] || @template.polymorphic_path([controller, action])
    q = {param => target}.to_query
    path.include?('?') ? "#{path}&#{q}" : "#{path}?#{q}"
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    previous_or_next_page(num, @options[:previous_label], 'prev')
  end
  
  def next_page
    num = @collection.current_page < @collection.total_pages && @collection.current_page + 1
    previous_or_next_page(num, @options[:next_label], 'next')
  end

  def gap
    text = @template.will_paginate_translate(:page_gap) { '&hellip'; }
    %(<li><a href="#">#{text}</a></li>)
  end


  def previous_or_next_page(page, text, classname)
    if page
      @template.content_tag :li, :class => classname do
        link(text, page).html_safe
      end
    else
      @template.content_tag :li, :class => "#{classname} disabled" do
        link(text, page).html_safe
      end
    end
  end

  def html_container(html)
    @template.content_tag :div, container_attributes do
      @template.content_tag :ul do
        html.html_safe
      end
    end
  end

  def controller
    @options[:controller] || @collection.first.class.to_s.underscore.intern
  end

  def action
    @options[:action] || :index
  end
end
