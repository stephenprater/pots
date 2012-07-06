class CreateVessellDesigns < ActiveRecord::Migration
  def change
    create_table :vessell_designs do |t|
      t.references :vessell
      t.references :design, :polymorphic => true
    end
  end
end
