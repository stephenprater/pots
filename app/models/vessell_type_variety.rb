class VesselTypeVariety < ActiveRecord::Base
  belongs_to :vessell
  belongs_to :type_variety, :polymorphic => true
end
