class CreateLipAttributes < ActiveRecord::Migration
  def change
    create_table :lip_attributes do |t|
      #description
      t.string :shape
      t.text :decoration

      #metrics
      t.float :thickness

      #relationship
      t.reference :vessell
    end
  end
end
