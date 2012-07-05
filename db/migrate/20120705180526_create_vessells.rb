class CreateVessells < ActiveRecord::Migration
  def change
    create_table :vessells do |t|
      #catalog information
      t.string :accession_number
      t.date :form_date
      t.string :vessell_number
      t.string :project_name
      t.string :collection
      t.string :analyst
      t.string :feature_number
      t.string :burial_number
      t.text :other_catalog_information
      t.string :unit_of_measurement, :default => 'cm'

      #vessell description
      t.string :authenticity
      t.string :condition
      t.string :missing_portions
      t.string :use_wear
      t.string :cultural_affliation
      t.string :appendages
      t.float :weight #grams
      t.float :volume #uofm cubed

      #subjective
      t.text :description
      t.text :comments

      t.reference :county
      t.reference :site

      t.timestamps
    end
  end
end



