class LookupAttribute < ActiveRecord::Base
  attr_accessible :value
  validates_presence_of :value
end
