class AddViewsCountToMaps < ActiveRecord::Migration
  def change

    add_column :maps, :views_count, :integer, :default => 0
  end
end
