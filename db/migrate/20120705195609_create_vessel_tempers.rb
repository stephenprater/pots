class CreateVesselTempers < ActiveRecord::Migration
  def change
    create_table :vessel_tempers do |t|
      t.reference :vessel
      t.reference :temper
    end
  end
end
