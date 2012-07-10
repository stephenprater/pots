class VessellAttributesPaste < ActiveRecord::Base
  attr_accessible :compaction, :hardness, :smoothness
  
  belongs_to :vessell_attributes
  belongs_to :paste
end
