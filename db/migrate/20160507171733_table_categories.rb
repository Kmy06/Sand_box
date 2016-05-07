class TableCategories < ActiveRecord::Migration
  def change
  	create_table :categories
  	add_column :categories, :title, :string
  end
end
