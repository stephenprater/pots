class CreateRimAttributes < ActiveRecord::Migration
  def change
    create_table :rim_attributes do |t|
      #description
      t.string :shape
      t.string :mode
      t.boolean :continuous_profile
      t.text :decoration

      #metrics
      t.float :height
      t.float :diameter
      t.float :thickness
      t.float :angle
      
      t.references :vessell
    end
  end
end
