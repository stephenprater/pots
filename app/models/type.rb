class Type < ActiveRecord::Base
  attr_accessible :description

  has_many :varieties
  has_many :vessell_types
end
