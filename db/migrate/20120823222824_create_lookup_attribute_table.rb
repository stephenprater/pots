class CreateLookupAttributeTable < ActiveRecord::Migration
  def up
    create_table :lookup_attributes do |t|
      t.string "value"
      t.string "type"
      t.integer "lookup_attribute_vessell_id"
      t.timestamps
    end

    create_table :vessell_lookup_attributes do |t|
      t.integer "lookup_attribute_id"
      t.integer "vessell_id"
    end
  end

  def down
    drop_table :lookup_attributes
    drop_table :vessell_lookup_attributes
  end
end
