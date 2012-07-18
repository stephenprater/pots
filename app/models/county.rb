class County < ActiveRecord::Base
  attr_accessible :name, :abbreviation

  has_many :sites
end
