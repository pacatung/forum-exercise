class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :c_description

      t.timestamps
    end
  end
end
