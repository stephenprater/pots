class NeckAttributes < ActiveRecord::Base
  attr_accessible :base_exterior_diameter, :height, :mid_exterior_diameter, :orifice_diameter, :shape, :thickness

  belongs_to :surface_treatment
  belongs_to :vessell

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
