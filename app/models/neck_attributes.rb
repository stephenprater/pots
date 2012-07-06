class NeckAttributes < ActiveRecord::Base
  attr_accessible :base_exterior_diameter, :height, :mid_exterior_diameter, :orifice_diameter, :shape, :thickness

  belongs_to :vessell
  has_many :vessell_surface_treatments
  has_one :surface_treatment, 
    :through => :vessell_surface_treatments,
    :conditions => ['surface_treatment.location = ?','neck']

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
