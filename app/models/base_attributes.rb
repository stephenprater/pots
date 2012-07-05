class BaseAttributes < ActiveRecord::Base
  attr_accessible :form, :shape, :diameter_at_top, :diameter_at_bottom
end
