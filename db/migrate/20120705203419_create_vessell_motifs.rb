class CreateVessellMotifs < ActiveRecord::Migration
  def change
    create_table :vessell_motifs do |t|

      t.timestamps
    end
  end
end
