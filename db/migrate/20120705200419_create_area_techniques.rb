class CreateAreaTechniques < ActiveRecord::Migration
  def change
    create_table :area_techniques do |t|
      t.references :area, :polymorphic => true
      t.references :techinque
      t.timestamps
    end
  end
end
