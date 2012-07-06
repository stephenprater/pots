class CreateAppendages < ActiveRecord::Migration
  def change
    create_table :appendages do |t|
      t.string :description
      t.timestamps
    end
  end
end
