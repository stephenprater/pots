class CreatePhotographs < ActiveRecord::Migration
  def change
    create_table :photographs do |t|
      t.string :description
      t.string :file_name
      t.string :photographer
      t.string :photo_number

      t.references :vessell

      t.timestamps
    end
  end
end
