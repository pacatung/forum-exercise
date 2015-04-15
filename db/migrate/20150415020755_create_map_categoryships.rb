class CreateMapCategoryships < ActiveRecord::Migration
  def change
    create_table :map_categoryships do |t|
      t.integer :map_id
      t.integer :category_id

      t.timestamps
    end

    add_index :map_categoryships, :map_id
    add_index :map_categoryships, :category_id
  end
end
