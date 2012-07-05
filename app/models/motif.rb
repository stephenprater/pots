class Motif < ActiveRecord::Base
  attr_accessible :description

  has_many :vessell_motifs
  has_many :vessells, :through => :vessell_motifs

  has_many :elements, :through => :vessell_motifs
end
