class CreateAreaTechniques < ActiveRecord::Migration
  def change
    create_table :area_techniques do |t|
      t.reference :area, :polymorphic => true
      t.reference :techinque
      t.timestamps
    end
  end
end
