class Vessell < ActiveRecord::Base
   attr_accessible :accession_number, :form_date, :vessell_number, :project_name,
     :collection, :analyst, :feature_number, :burial_number, :other_catalog_information,
     :unit_of_measurement, :authenticity, :condition, :missing_portions, :use_wear,
     :cultural_affliation, :appendages, :weight, :volume, :description, :comments

  #type variety
  has_many :vessell_type_varieties
  has_many :types, :through => :vessell_type_varieties, :as => :typology
  has_many :varieties, :through => :vessell_type_varieties, :as => :varieity

  #element, motif, design
  has_many :vessell_designs
  has_many :compositions, :through => :vessell_designs, :as => :composition
  has_many :motifs, :through => :vessell_designs, :as => :motifs
  has_many :elements, :through => :vessell_designs, :as => :elements
  
  #i think maybe this is wrong
  has_one :design_structure

  #effigies
  has_many :vessell_attachments
  has_many :effigies, :through => :vessell_attachments, :as => :attachment
  has_many :appendages, :through => :vessell_attachments, :as => :attachment

  #simplification tables.
  #it's functionally equivalent to fuckton of columns
  has_one :base_attributes
  has_one :body_attributes
  has_one :handle_attributes
  has_one :lip_attributes
  has_one :neck_attributes
  has_one :rim_attributes
  has_one :vessell_attributes
  #each one of these has a surface treatment, some techinques

  has_many :photographs
  has_many :vessell_citations
  has_many :citations, :through => :vessell_citations, :order => 'order ASC'

  #two conditional colors on 'interior' and 'exterior'
  has_many :vessell_colors
  has_many :colors, :through => :vessell_colors

  belongs_to :site
  belongs_to :county

  accepts_nested_attributes_for :site

end
