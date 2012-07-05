class CreateVessellEffigies < ActiveRecord::Migration
  def change
    create_table :vessell_effigies do |t|

      t.timestamps
    end
  end
end
