module ApplicationHelper
  def will_remote_paginate collection = nil, options = {} 
    options.reverse_merge! :renderer => RemoteLinkRenderer
    will_paginate collection, options
  end
end
