class AddVessellIdToVessellColors < ActiveRecord::Migration
  def change
    add_column :vessell_colors, :vessell_id, :integer
  end
end
