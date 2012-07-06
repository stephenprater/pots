class Appendages < ActiveRecord::Base
  attr_accessible :description

  has_many :vessell_attachments, :as => :attachment
  has_many :vessells, :through => :vessell_attachments
end
