class AddCategoryIdToBoards < ActiveRecord::Migration
  def change
  	add_column :boards, :category_id, :integer
  	add_index :boards, :category_id
  end
end
