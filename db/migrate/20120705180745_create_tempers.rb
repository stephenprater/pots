class CreateTemper < ActiveRecord::Migration
  def change
    create_table :tempers do |t|
      t.string :description

      t.timestamps
    end
  end
end
