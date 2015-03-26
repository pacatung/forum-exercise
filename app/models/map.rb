class Map < ActiveRecord::Base

  vaildates_presence_of :name, :country, :time

end
