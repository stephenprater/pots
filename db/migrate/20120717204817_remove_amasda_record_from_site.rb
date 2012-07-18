class RemoveAmasdaRecordFromSite < ActiveRecord::Migration
  def change 
    remove_column :sites, :amasda_record
  end
end
