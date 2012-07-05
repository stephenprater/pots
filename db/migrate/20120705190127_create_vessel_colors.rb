class CreateVesselColors < ActiveRecord::Migration
  def change
    create_table :vessel_colors do |t|

      t.timestamps
    end
  end
end
