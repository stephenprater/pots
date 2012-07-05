class CreateMotifs < ActiveRecord::Migration
  def change
    create_table :motifs do |t|
      t.string :description

      t.timestamps
    end
  end
end
