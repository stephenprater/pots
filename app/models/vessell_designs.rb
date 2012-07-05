class VessellDesigns < ActiveRecord::Base
  attr_accessible :area

  belongs_to :vessell
  belongs_to :design

  has_many :vessell_motifs
  has_many :motifs, :through => :vessell_motifs

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
