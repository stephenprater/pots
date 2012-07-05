class CreateVessellElements < ActiveRecord::Migration
  def change
    create_table :vessell_elements do |t|

      t.timestamps
    end
  end
end
