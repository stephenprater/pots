class CreateVesselTempers < ActiveRecord::Migration
  def change
    create_table :vessel_attributes_tempers do |t|
      #temper parameters
      t.string :size
      t.string :abundance
      t.string :grit_type
      t.string :observation_method
       
      t.reference :vessel_attributes
      t.reference :temper
    end
  end
end
