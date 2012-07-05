class AreaTechnique < ActiveRecord::Base
  attr_accessible :area, :techinque
  belongs_to :area, :polymorphic => true
  belongs_to :techinque
end
