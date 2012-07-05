class Temper < ActiveRecord::Base
  attr_accessible :size, :abundance, :grit_type
  has_many :vessel_tempers
  #do we need to get to vessells from here
end
