class CreateBodyAttributes < ActiveRecord::Migration
  def change
    create_table :body_attributes do |t|
      #description
      t.string :form
      t.string :shape
      t.string :mode

      #metrics
      t.float :height
      t.float :diameter
      t.float :thickness

      t.timestamps
    end
  end
end
