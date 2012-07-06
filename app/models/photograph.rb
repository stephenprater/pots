class Photograph < ActiveRecord::Base
  attr_accessible :description, :file_name, :photographer, :photos_number

  belongs_to :vessell
end
