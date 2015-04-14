class RenameColumnAtCommentsTable < ActiveRecord::Migration
  def change

    # rename_column(table, old_column_name, new_column_name)

    rename_column(:comments, :topic_id, :map_id)
  end
end
