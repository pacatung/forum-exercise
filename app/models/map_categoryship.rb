class MapCategoryship < ActiveRecord::Base
  belongs_to :map
  belongs_to :category

end
