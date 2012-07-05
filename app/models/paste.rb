class Paste < ActiveRecord::Base
  attr_accessible :type, :compaction, :hardness, :smoothness

  has_many :vessell_attributes
end
