class CreatePastes < ActiveRecord::Migration
  def change
    create_table :pastes do |t|
      t.string :type
      t.timestamps
    end
  end
end
