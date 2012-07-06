class CreateVessellDesigns < ActiveRecord::Migration
  def change
    create_table :vessell_compositions do |t|
      t.reference :vessell
      t.belongs :design, :polymorphic => true
    end
  end
end
