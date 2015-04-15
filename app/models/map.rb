class Map < ActiveRecord::Base

  validates_presence_of :name, :country, :time

  has_many :comments, :dependent => :destroy

  belongs_to :user

  has_many :map_categoryships
  has_many :categories, :through => :map_categoryships


  def view!
    self.increment!(:views_count)
  end

  def author_name
    user.try(:display_name) || "Nobody"
  end

end
