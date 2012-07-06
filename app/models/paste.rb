class Paste < ActiveRecord::Base
  attr_accessible :type

  has_many :vessell_attributes_pastes
end
