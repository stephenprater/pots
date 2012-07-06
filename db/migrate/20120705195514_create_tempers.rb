class CreateTempers < ActiveRecord::Migration
  def change
    create_table :tempers do |t|
      t.string :material
      t.timestamps
    end
  end
end
