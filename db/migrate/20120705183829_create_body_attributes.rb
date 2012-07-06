class CreateBodyAttributes < ActiveRecord::Migration
  def change
    create_table :body_attributes do |t|
      #description
      t.string :form
      t.string :shape
      t.string :mode
      t.text :decoration

      #metrics
      t.float :height
      t.float :diameter
      t.float :thickness

      t.references :vessell
    end
  end
end
