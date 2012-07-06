class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.references :county
      t.text :description
      t.string :site_number
      t.string :amasda_record

      t.timestamps
    end
  end
end
