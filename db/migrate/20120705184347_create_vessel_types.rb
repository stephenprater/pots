class CreateVesselTypes < ActiveRecord::Migration
  def change
    create_table :vessel_types do |t|

      t.timestamps
    end
  end
end
