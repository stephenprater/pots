class CreateVessells < ActiveRecord::Migration
  def change
    create_table :vessells do |t|
      #form meta
      t.date :form_date
      t.string :analyst
      t.string :project_name
      
      #catalog information
      t.string :accession_number
      t.string :vessell_number
      t.text :other_catalog_information
      t.string :collection
      t.string :feature_number
      t.string :burial_number
      t.string :unit_of_measurement #this should be an enum

      #vessell description
      t.string :authenticity #this should be an enum
      t.string :condition #this should be an enum
      t.string :missing_portions #optional field
      t.string :use_wear
      t.string :cultural_affliation

      #metrics
      t.float :weight #grams
      t.float :volume #uofm cubed

      #subjective
      t.text :description
      t.text :comments

      #unused - but we have columns
      t.text :photos_in_publication
      t.text :collegiate_pattern

      t.references :county
      t.references :site

      t.timestamps
    end
  end
end



