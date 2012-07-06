class CreateDesignStructures < ActiveRecord::Migration
  def change
    create_table :design_structures do |t|
      t.string :description
      t.references :vessell
    end
  end
end
