class DesignStructure < ActiveRecord::Base
  attr_accessible :description

  belongs_to :vessell

  has_many :designs, :through => :vessell
end
