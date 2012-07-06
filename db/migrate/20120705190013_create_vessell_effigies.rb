class CreateVessellEffigies < ActiveRecord::Migration
  def change
    create_table :vessell_attachments do |t|
      t.string :location
      
      t.references :vessell
      t.references :attachment, :polymorphic => true
     
      t.timestamps
    end
  end
end
