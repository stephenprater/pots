class CreateVesselTypes < ActiveRecord::Migration
  def change
    create_table :vessel_type_variety do |t|
      t.reference :vessell
      t.belongs_to :type_variety, :polymorphic => true
    end
  end
end
