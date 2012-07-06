class CreateVessellSurfaceTreatments < ActiveRecord::Migration
  def change
    create_table :vessell_surface_treatments do |t|
      t.references :vessell
      t.references :surface_treatement
      t.string :location
    end
    add_index :vessell_surface_treatments, :vessell_id
    add_index :vessell_surface_treatments, :surface_treatement_id
    add_index :vessell_surface_treatments, :location
  end
end
