class CreateVessellTypeVariety < ActiveRecord::Migration
  def change
    create_table :vessell_type_variety do |t|
      t.references :vessell
      t.belongs_to :type_variety, :polymorphic => true
    end
  end
end
