class AddVessellIdToVessellAttributes < ActiveRecord::Migration
  def change
    #whoops
    rename_table :vessel_attributes, :vessell_attributes
    add_column :vessell_attributes, :vessell_id, :integer
  end
end
