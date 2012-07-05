class CreateRimAttributes < ActiveRecord::Migration
  def change
    create_table :rim_attributes do |t|
      #description
      t.string :shape
      t.string :angle
      t.string :mode
      t.boolean :continuous_profile

      #metrics
      t.float :height
      t.float :diameter
      t.float :thickness

      t.references :surface_treatment
      t.references :vessell

      t.timestamps
    end
  end
end
