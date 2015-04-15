class AddColumnToMapCategoryshipAgain < ActiveRecord::Migration
  def change
    add_column :map_categoryships, :map_id, :integer
    add_column :map_categoryships, :category_id, :integer

    add_index :map_categoryships, :map_id
    add_index :map_categoryships, :category_id
  end
end
