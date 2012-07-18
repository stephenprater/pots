class AddAbbreviationToCounties < ActiveRecord::Migration
  def change
    add_column :counties, :abbreviation, :string
  end
end
