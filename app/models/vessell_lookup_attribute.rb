class VessellLookupAttribute < ActiveRecord::Base
  belongs_to :vessell
  belongs_to :lookup_attribute
end
