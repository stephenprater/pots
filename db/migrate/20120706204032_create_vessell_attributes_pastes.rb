class CreateVessellAttributesPastes < ActiveRecord::Migration
  def change
    create_table :vessell_attributes_pastes do |t|
      t.references :vessell_attributes
      t.reference :paste
      t.string :compaction
      t.string :hardness
      t.string :smoothness

      t.timestamps
    end
    add_index :vessell_attributes_pastes, :vessell_attributes_id
  end
end
