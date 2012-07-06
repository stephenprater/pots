class VessellSurfaceTreatment < ActiveRecord::Base
  attr_accessible :location
  
  belongs_to :vessell
  belongs_to :surface_treatement
end
