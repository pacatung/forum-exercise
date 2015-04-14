class RenameColumnAtCommentsTableAgain < ActiveRecord::Migration
  def change
    rename_column(:comments, :c_description, :content)
  end
end
