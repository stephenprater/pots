class Site < ActiveRecord::Base
  attr_accessible :description, :site_number, :amasda_record, :name

  has_many :vessells
  belongs_to :county
end
