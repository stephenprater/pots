class ProjectName < LookupAttribute
  belongs_to :lookup_attribute
  has_many :vessell_lookup_attribute
  has_many :vessells, :through => :vessell_lookup_attribute
end
