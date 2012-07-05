class CreatePhotographs < ActiveRecord::Migration
  def change
    create_table :photographs do |t|
      t.string :description
      t.string :file_name

      t.reference :vessell

      t.timestamps
    end
  end
end
