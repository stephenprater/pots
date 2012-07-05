class CreateNeckAttributes < ActiveRecord::Migration
  def change
    create_table :neck_attributes do |t|
      #description
      t.string :shape

      #metric
      t.float :height
      t.float :orifice_diameter
      t.float :thickness
      t.float :mid_exterior_diameter
      t.float :base_exterior_diameter


      t.reference :surface_treatment
      t.reference :vessell

      t.timestamps
    end
  end
end
