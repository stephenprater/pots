module ApplicationHelper
  def will_remote_paginate collection = nil, options = {} 
    options.reverse_merge! :renderer => RemoteLinkRenderer
    will_paginate collection, options
  end

  def unique_child_index
    SecureRandom.uuid
  end

  def block_to_partial partial_name, options = {}, &block
    options.merge!(:body => capture(&block))
    concat(render(:partial => partial_name, :locals => options), block.binding)
  end
end
