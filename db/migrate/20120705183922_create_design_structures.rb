class CreateDesignStructures < ActiveRecord::Migration
  def change
    create_table :design_structures do |t|
      t.string :description

      t.timestamps
    end
  end
end
