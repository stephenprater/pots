class VessellDesign < ActiveRecord::Base
  attr_accessible :area

  belongs_to :vessell
  belongs_to :design, :polymorphic => true

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
