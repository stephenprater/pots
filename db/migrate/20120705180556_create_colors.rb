class CreateColors < ActiveRecord::Migration
  def change
    create_table :colors do |t|
      t.string :description
      t.integer :l
      t.integer :a
      t.integer :b

      t.timestamps
    end
  end
end
