class CreateLipAttributes < ActiveRecord::Migration
  def change
    create_table :lip_attributes do |t|
      #description
      t.string :shape

      #metrics
      t.float :thickness

      #relationship
      t.reference :surface_treatment
      t.reference :vessell
    end
  end
end
