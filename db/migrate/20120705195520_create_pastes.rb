class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.string :type
      t.string :compaction
      t.string :hardness
      t.string :smoothness
      t.timestamps
    end
  end
end
