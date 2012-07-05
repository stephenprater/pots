class Design < ActiveRecord::Base
  attr_accessible :description

  has_many :vessell_designs
  has_many :vessells, :through => :vessell_designs

  has_many :motifs, :through => :vessell_designs
end
