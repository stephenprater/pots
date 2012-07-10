class Variety < ActiveRecord::Base
  attr_accessible :description

  belongs_to :typology
end
