class Temper < ActiveRecord::Base
  attr_accessible :material
  has_many :vessel_attributes_tempers
  #do we need to get to vessells from here
end
