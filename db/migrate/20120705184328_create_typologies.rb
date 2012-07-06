class CreateTypologies < ActiveRecord::Migration
  def change
    create_table :typologies do |t|
      t.string :description
      t.timestamps
    end
  end
end
