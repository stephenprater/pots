class CreateDesignStructures < ActiveRecord::Migration
  def change
    create_table :design_structures do |t|
      t.string :description
      t.reference :vessell

      t.timestamps
    end
  end
end
