class Map < ActiveRecord::Base

     validates_presence_of :name, :country, :time

     has_many :comments, :dependent => :destroy

     belongs_to :user


  def view!
    self.increment!(:views_count)
  end

  def author_name
    user.try(:display_name) || "Nobody"
  end
end
