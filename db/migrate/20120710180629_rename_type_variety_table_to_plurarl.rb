class RenameTypeVarietyTableToPlurarl < ActiveRecord::Migration
  def up
    rename_table :vessell_type_variety, :vessell_type_varieties
  end

  def down
    rename_table :vessell_type_varieties, :vessell_type_variety
  end
end
