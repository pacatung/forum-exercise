class Map < ActiveRecord::Base

     validates_presence_of :name, :country, :time

     has_many :comments


end
