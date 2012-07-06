class CreateCitations < ActiveRecord::Migration
  def change
    create_table :citations do |t|
      t.string :author
      t.date :date
      t.string :publisher
      t.string :title
      t.string :page

      t.timestamps
    end
  end
end
