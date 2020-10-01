class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :coffee_shop

  validates :content, presence: true
 
  def username
    self.user.username
  end

end
