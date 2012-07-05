class CreateTempers < ActiveRecord::Migration
  def change
    create_table :tempers do |t|
      t.string :type
      t.string :size
      t.string :abundance
      t.string :grit_type

      t.timestamps
    end
  end
end
