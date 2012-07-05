class CreateDesigns < ActiveRecord::Migration
  def change
    create_table :designs do |t|
      t.string :description

      t.timestamps
    end
  end
end
