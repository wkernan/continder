class ChangeContentToText < ActiveRecord::Migration
  def up
  	change_column :stories, :content, :text, :null => false
  end

  def down
  	change_column :stories, :content, :string
  end
end
