class CreateVessellVarieties < ActiveRecord::Migration
  def change
    create_table :vessell_varieties do |t|
      t.belongs_to :vessel
      t.belongs_to :variety

      t.timestamps
    end
    add_index :vessell_varieties, :vessel_id
    add_index :vessell_varieties, :variety_id
  end
end
