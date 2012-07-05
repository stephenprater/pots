class VessellMotifs < ActiveRecord::Base
  attr_accessible :area

  belongs_to :vessell
  belongs_to :vessell_designs
  belongs_to :motif

  has_many :vessell_elements
  has_many :elements, :through => :vessell_elements

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
