class CreateBaseAttributes < ActiveRecord::Migration
  def change
    create_table :base_attributes do |t|
      #description
      t.string :shape
      t.text :decoration

      #metrics
      t.float :diameter_at_top
      t.float :diameter_at_bottom

      t.references :vessell

      t.timestamps
    end
  end
end
