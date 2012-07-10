# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120710182303) do

  create_table "appendages", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "area_techniques", :force => true do |t|
    t.integer "area_id"
    t.string  "area_type"
    t.integer "techinque_id"
  end

  create_table "base_attributes", :force => true do |t|
    t.string  "shape"
    t.text    "decoration"
    t.float   "diameter_at_top"
    t.float   "diameter_at_bottom"
    t.integer "vessell_id"
  end

  create_table "body_attributes", :force => true do |t|
    t.string  "form"
    t.string  "shape"
    t.string  "mode"
    t.text    "decoration"
    t.float   "height"
    t.float   "diameter"
    t.float   "thickness"
    t.integer "vessell_id"
  end

  create_table "citations", :force => true do |t|
    t.string   "author"
    t.date     "date"
    t.string   "publisher"
    t.string   "title"
    t.string   "page"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "colors", :force => true do |t|
    t.string   "description"
    t.integer  "l"
    t.integer  "a"
    t.integer  "b"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "compositions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "counties", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "design_structures", :force => true do |t|
    t.string  "description"
    t.integer "vessell_id"
  end

  create_table "effigies", :force => true do |t|
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "elements", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "handle_attributes", :force => true do |t|
    t.string  "shape"
    t.string  "decoration"
    t.string  "appendage"
    t.integer "vessell_id"
  end

  create_table "lip_attributes", :force => true do |t|
    t.string  "shape"
    t.text    "decoration"
    t.float   "thickness"
    t.integer "vessell_id"
  end

  create_table "motifs", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "neck_attributes", :force => true do |t|
    t.string  "shape"
    t.text    "decoration"
    t.float   "height"
    t.float   "thickness"
    t.float   "orifice_diameter"
    t.float   "mid_exterior_diameter"
    t.float   "base_exterior_diameter"
    t.integer "vessell_id"
  end

  create_table "pastes", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photographs", :force => true do |t|
    t.string   "description"
    t.string   "file_name"
    t.string   "photographer"
    t.string   "photo_number"
    t.integer  "vessell_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "rim_attributes", :force => true do |t|
    t.string  "shape"
    t.string  "mode"
    t.boolean "continuous_profile"
    t.text    "decoration"
    t.float   "height"
    t.float   "diameter"
    t.float   "thickness"
    t.float   "angle"
    t.integer "vessell_id"
  end

  create_table "sites", :force => true do |t|
    t.integer  "county_id"
    t.text     "description"
    t.string   "site_number"
    t.string   "amasda_record"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "surface_treatments", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "techniques", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tempers", :force => true do |t|
    t.string   "material"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "typologies", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "varieties", :force => true do |t|
    t.string   "description"
    t.integer  "typologies_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "vessell_attachments", :force => true do |t|
    t.string  "location"
    t.integer "vessell_id"
    t.integer "attachment_id"
    t.string  "attachment_type"
  end

  create_table "vessell_attributes", :force => true do |t|
    t.string  "shape"
    t.boolean "carinated_vessell"
    t.boolean "effigy_vessell"
    t.float   "height"
    t.float   "max_diameter"
    t.string  "max_diameter_at"
    t.integer "vessell_id"
  end

  create_table "vessell_attributes_pastes", :force => true do |t|
    t.integer "vessell_attributes_id"
    t.integer "paste_id"
    t.string  "compaction"
    t.string  "hardness"
    t.string  "smoothness"
  end

  add_index "vessell_attributes_pastes", ["vessell_attributes_id"], :name => "index_vessell_attributes_pastes_on_vessell_attributes_id"

  create_table "vessell_attributes_tempers", :force => true do |t|
    t.string  "size"
    t.string  "abundance"
    t.string  "grit_type"
    t.string  "observation_method"
    t.integer "vessell_attributes_id"
    t.integer "temper_id"
  end

  create_table "vessell_citations", :force => true do |t|
    t.integer "vessell_id"
    t.integer "citation_id"
    t.integer "order"
  end

  add_index "vessell_citations", ["citation_id"], :name => "index_vessell_citations_on_citation_id"
  add_index "vessell_citations", ["vessell_id"], :name => "index_vessell_citations_on_vessell_id"

  create_table "vessell_colors", :force => true do |t|
    t.string  "location"
    t.integer "color_id"
    t.integer "vessell_id"
  end

  create_table "vessell_designs", :force => true do |t|
    t.integer "vessell_id"
    t.integer "design_id"
    t.string  "design_type"
  end

  create_table "vessell_surface_treatments", :force => true do |t|
    t.integer "vessell_id"
    t.integer "surface_treatement_id"
    t.string  "location"
  end

  add_index "vessell_surface_treatments", ["location"], :name => "index_vessell_surface_treatments_on_location"
  add_index "vessell_surface_treatments", ["surface_treatement_id"], :name => "index_vessell_surface_treatments_on_surface_treatement_id"
  add_index "vessell_surface_treatments", ["vessell_id"], :name => "index_vessell_surface_treatments_on_vessell_id"

  create_table "vessell_type_varieties", :force => true do |t|
    t.integer "vessell_id"
    t.integer "type_variety_id"
    t.string  "type_variety_type"
  end

  create_table "vessells", :force => true do |t|
    t.date     "form_date"
    t.string   "analyst"
    t.string   "project_name"
    t.string   "accession_number"
    t.string   "vessell_number"
    t.text     "other_catalog_information"
    t.string   "collection"
    t.string   "feature_number"
    t.string   "burial_number"
    t.string   "unit_of_measurement"
    t.string   "authenticity"
    t.string   "condition"
    t.string   "missing_portions"
    t.string   "use_wear"
    t.string   "cultural_affliation"
    t.float    "weight"
    t.float    "volume"
    t.text     "description"
    t.text     "comments"
    t.text     "photos_in_publication"
    t.text     "collegiate_pattern"
    t.integer  "county_id"
    t.integer  "site_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

end
