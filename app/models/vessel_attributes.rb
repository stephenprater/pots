class VesselAttributes < ActiveRecord::Base
  attr_accessible :height, :max_diameter, :max_diameter_at, :shape

  has_many :vessel_tempers
  has_many :tempers, :through => :vessel_tempers

  belongs_to :paste
end
