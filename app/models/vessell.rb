class Vessell < ActiveRecord::Base
  class << self
    def units
      { 
        centimeters: 0,
        inches: 1
      }
    end

    def authenticity
      {
        authentic: 0,
        fake: 1,
        fake_as_hell: 2,
        dunno: 3
      }
    end

    def condition
      {
        broke: 0,
        really_broke: 1,
        kinda_broke: 2,
        somebody_put_it_back_together: 3
      }
    end
  end

  default_value_for :form_date, Date.today


  attr_accessible :accession_number, :form_date, :vessell_number, :project_name,
     :collection, :analyst, :feature_number, :burial_number, :other_catalog_information,
     :unit_of_measurement, :authenticity, :condition, :missing_portions, :use_wear,
     :cultural_affliation, :appendages, :weight, :volume, :description, :comments

  has_many :vessell_lookup_attributes
  
  has_many :analyst, :through => :vessell_lookup_attributes, :source => :lookup_attribute
  has_many :project_name, :through => :vessell_lookup_attributes, :source => :lookup_attribute
  has_many :collection, :through => :vessell_lookup_attributes, :source => :lookup_attribute
  has_many :cultural_affliation, :through => :vessell_lookup_attributes, :source => :lookup_attribute


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
