class CreateSurfaceTreatments < ActiveRecord::Migration
  def change
    create_table :surface_treatments do |t|
      t.description :string

      t.timestamps
    end
  end
end
