class VessellCitation < ActiveRecord::Base
  belongs_to :vessell
  belongs_to :citation
  attr_accessible :order
end
