class CleanUpVessellsTable < ActiveRecord::Migration
  def change
    remove_column :vessells, :project_name
    remove_column :vessells, :analyst
    remove_column :vessells, :collection
    remove_column :vessells, :cultural_affliation
  end
end
