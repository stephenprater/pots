class LipAttributes < ActiveRecord::Base
  attr_accessible :shape, :thickness, :decoration

  belongs_to :vessell
  has_many :vessell_surface_treatments
  has_one :surface_treatment, 
    :through => :vessell_surface_treatments,
    :conditions => ['surface_treatment.location = ?','lip']

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
