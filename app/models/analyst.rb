class Analyst < LookupAttribute
  belongs_to :vessell_lookup_attribute, :polymorphic => true
  has_many :vessells, :through => :vessell_lookup_attribute
end
