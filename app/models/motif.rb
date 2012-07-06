class Motif < ActiveRecord::Base
  attr_accessible :description

  has_many :vessell_designs
  has_many :vessells, :through => :vessell_designs
  has_many :elements, :through => :vessell_designs, :as => :element
end
