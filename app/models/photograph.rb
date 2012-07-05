class Photograph < ActiveRecord::Base
  attr_accessible :description, :file_name

  belongs_to :vessell
end
