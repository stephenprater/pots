class VesselTemper < ActiveRecord::Base
  belongs_to :temper
  belongs_to :vessel_attributes
end
