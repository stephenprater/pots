class CreateVesselTempers < ActiveRecord::Migration
  def change
    create_table :vessel_attributes_tempers do |t|
      #temper parameters
      t.string :size
      t.string :abundance
      t.string :grit_type
      t.string :observation_method
       
      t.references :vessel_attributes
      t.references :temper
    end
  end
end
