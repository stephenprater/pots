class CreateBaseAttributes < ActiveRecord::Migration
  def change
    create_table :base_attributes do |t|
      #description
      t.string :form
      t.string :shape

      #metrics
      t.float :diameter_at_top
      t.float :diameter_at_bottom

      t.reference :surface_treatement

      t.timestamps
    end
  end
end
