class CreateMaps < ActiveRecord::Migration
  def change
    create_table :maps do |t|

        t.string   "name"
    t.string   "country"
    t.string   "time"
    t.integer  "money"
    t.integer  "days"
    t.text     "description"

      t.timestamps
    end
  end
end
