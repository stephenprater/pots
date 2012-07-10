class RenameTablesSoThatVessellIsSpelledRight < ActiveRecord::Migration
  def up
    rename_table :vessel_attributes_tempers, :vessell_attributes_tempers
    rename_column :vessell_attributes_tempers, :vessel_attributes_id, :vessell_attributes_id
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
