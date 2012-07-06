class CreateNeckAttributes < ActiveRecord::Migration
  def change
    create_table :neck_attributes do |t|
      #description
      t.string :shape
      t.text :decoration

      #metric
      t.float :height
      t.float :thickness
      t.float :orifice_diameter
      t.float :mid_exterior_diameter
      t.float :base_exterior_diameter

      t.references :vessell
    end
  end
end
