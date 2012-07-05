class CreateEffigies < ActiveRecord::Migration
  def change
    create_table :effigies do |t|
      t.text :description

      t.timestamps
    end
  end
end
