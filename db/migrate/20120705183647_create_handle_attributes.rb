class CreateHandleAttributes < ActiveRecord::Migration
  def change
    create_table :handle_attributes do |t|
      #description
      t.string :shape
      t.string :decoration
      t.string :appendage

      #nometrics for handle

      t.reference :vessell

      t.timestamps
    end
  end
end
