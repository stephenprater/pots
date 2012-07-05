class Vessell < ActiveRecord::Base
   attr_accessible :accession_number, :form_date, :vessell_number, :project_name,
     :collection, :analyst, :feature_number, :burial_number, :other_catalog_information,
     :unit_of_measurement, :authenticity, :condition, :missing_portions, :use_wear,
     :cultural_affliation, :appendages, :weight, :volume, :description, :comments

  #type variety
  has_many :vessell_types
  has_many :types, :through => :vessell_types
  has_many :varieties, :through => :types

  #element, motif, design
  has_many :vessell_designs
  has_many :designs, :through => :vessell_designs
  has_many :vessell_motifs, :through => :vessell_designs
  has_many :motifs, :through => :vessell_motifs
  has_many :vessell_elements, :through => :vessell_motifs
  has_many :elements, :through => :vessell_elements

  #effigies
  has_many :vessell_effigies
  has_many :effigies, :through => :vessell_effigies

  #i think maybe this is wrong
  has_one :design_structure

  has_one :base_attributes
  has_one :body_attributes
  has_one :handle_attributes
  has_one :lip_attributes
  has_one :neck_attributes
  has_one :rim_attributes

  has_many :photographs

  belongs_to :site
  has_one :county, :through => :site

  has_many :colors, :class_name => 'VessellColor'

  #two conditional colors on 'interior' and 'exterior'

end
