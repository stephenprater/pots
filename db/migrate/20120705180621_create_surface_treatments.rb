class CreateSurfaceTreatments < ActiveRecord::Migration
  def change
    create_table :surface_treatments do |t|
      t.string :description

      t.timestamps
    end
  end
end
