class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :topic_id, :integer
    add_column :comments, :user_id, :integer

    add_index :comments, :topic_id
    add_index :comments, :user_id

  end

end
