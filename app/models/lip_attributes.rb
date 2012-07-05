class LipAttributes < ActiveRecord::Base
  attr_accessible :shape, :thickness

  belongs_to :vessell
  belongs_to :surface_treatment

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
