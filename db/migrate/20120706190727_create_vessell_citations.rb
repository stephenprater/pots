class CreateVessellCitations < ActiveRecord::Migration
  def change
    create_table :vessell_citations do |t|
      t.references :vessell
      t.references :citation
      t.integer :order
    end
    add_index :vessell_citations, :vessell_id
    add_index :vessell_citations, :citation_id
  end
end
