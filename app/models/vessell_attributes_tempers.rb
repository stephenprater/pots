class VessellAttributesTemper < ActiveRecord::Base
  attr_accessible :observation_method, :size, :abundance, :grit_type
  
  belongs_to :temper
  belongs_to :vessel_attributes
end
