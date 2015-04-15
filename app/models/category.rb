class Category < ActiveRecord::Base

  has_many :map_categoryships
  has_many :maps, :through => :map_categoryships

end
