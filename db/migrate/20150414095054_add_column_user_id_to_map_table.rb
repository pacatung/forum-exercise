class AddColumnUserIdToMapTable < ActiveRecord::Migration
  def change
    add_column :maps, :user_id, :integar

    add_index :maps, :user_id
  end
end
