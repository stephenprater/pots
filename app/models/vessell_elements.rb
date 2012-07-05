class VessellElements < ActiveRecord::Base
  attr_accessible :area

  belongs_to :vessell
  belongs_to :vessell_motifs
  belongs_to :element

  #no children
  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
