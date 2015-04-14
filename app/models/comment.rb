class Comment < ActiveRecord::Base
  belongs_to :map
  belongs_to :user

  def author_name
    user.try(:display_name) || "Nobody"
  end

  def can_delete_by?(u)
    ( self.user == u ) || (u.is_admin?)
  end
end
