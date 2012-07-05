class CreateVessellDesigns < ActiveRecord::Migration
  def change
    create_table :vessell_designs do |t|

      t.timestamps
    end
  end
end
