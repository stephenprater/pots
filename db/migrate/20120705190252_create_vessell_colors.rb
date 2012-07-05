class CreateVessellColors < ActiveRecord::Migration
  def change
    create_table :vessell_colors do |t|
      t.string :location
      t.reference :color

      t.timestamps
    end
  end
end
