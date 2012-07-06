class VesselAttributes < ActiveRecord::Base
  attr_accessible :shape, :carinated_vessell, :effigy_vessell, :height,
    :max_diameter, :max_diameter_at

  has_many :vessel_attributes_tempers
  has_many :tempers, :through => :vessel_attributes_tempers

  has_one :vessel_attributes_pastes
  has_one :paste, :through => :vessel_attributes_pastes

  has_many :vessell_surface_treatements
  has_many :surface_treatements, :through => :vessell_surface_treatements
end
