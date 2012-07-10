class RemoveExtraneousRelationColumns < ActiveRecord::Migration
  def change 
    remove_column :vessell_attributes, :paste_id 

    #these tables have timestamps but really don't need them
    #because they're vessell specific
    [:area_techniques, :vessell_attachments, :vessell_attributes_pastes].each do |table|
      remove_column table, :created_at
      remove_column table, :updated_at
    end
    
    add_column :techniques, :created_at, :datetime
    add_column :techniques, :updated_at, :datetime
  end
end
