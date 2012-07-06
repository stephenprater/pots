class Citation < ActiveRecord::Base
  attr_accessible :author, :date, :page, :publisher, :title
end
