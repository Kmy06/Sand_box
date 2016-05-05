class TableChats < ActiveRecord::Migration
  def change
  	create_table :chats
  	add_column :chats, :username, :string
  	add_column :chats, :msg, :text
  end
end
