class BodyAttributes < ActiveRecord::Base
  attr_accessible :diameter, :form, :height, :mode, :shape, :thickness

  belongs_to :surface_treatment
  belongs_to :vessell

  has_many :area_techniques, :as => :area
  has_many :techinques, :through => :area_techniques
end
