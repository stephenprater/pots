class CreateTemperTypes < ActiveRecord::Migration
  def change
    create_table :temper_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
