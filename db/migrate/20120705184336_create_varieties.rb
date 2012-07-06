class CreateVarieties < ActiveRecord::Migration
  def change
    create_table :varieties do |t|
      t.string :description
      t.references :typologies
      t.timestamps
    end
  end
end
