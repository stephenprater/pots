class VessellVarieties < ActiveRecord::Base
  belongs_to :vessel
  belongs_to :variety
  # attr_accessible :title, :body
end
