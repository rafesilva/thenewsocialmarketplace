class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :user_id, presence: true 
  validates :type, presence: true
   
end