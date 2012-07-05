class RimAttributes < ActiveRecord::Base
  attr_accessible :angle, :diameter, :height, :shape, :thickness, :continuous_profile, :mode

  belongs_to :vessell
  
  belongs_to :surface_treatment

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
