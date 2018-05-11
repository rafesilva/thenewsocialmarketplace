class Comment < ActiveRecord::Base
  belongs_to :post, :foreign_key => :post
  belongs_to :user, :foreign_key => :user
  validates :post_id, presence: true 
  validates :user_id, presence: true 
 

end
