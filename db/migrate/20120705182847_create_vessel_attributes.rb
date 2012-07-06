class CreateVesselAttributes < ActiveRecord::Migration
  def change
    create_table :vessel_attributes do |t|
      #description
      t.string :shape
      t.boolean :carinated_vessell
      t.boolean :effigy_vessell
      
      #metrics 
      t.float :height
      t.float :max_diameter
      t.string :max_diameter_at

      #paste
      t.references :paste
    end
  end
end
