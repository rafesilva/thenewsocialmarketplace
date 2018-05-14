class User < ActiveRecord::Base



  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable,:omniauthable, :omniauth_providers => [:stripe_connect]

    
    attr_accessor :url

    acts_as_messageable

    mount_uploader :avatar, AvatarUploader

    validates :email, presence: true, uniqueness: true

    has_many :products, foreign_key: :user_id, dependent: :destroy

    has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
    has_many :leaders, through: :subscriptions
    has_many :reverse_subscriptions, foreign_key: :leader_id, class_name: 'Subscription', dependent: :destroy 
    has_many :followers, through: :reverse_subscriptions
    
    has_many :posts, foreign_key: :user_id, dependent: :destroy
    has_many :text_posts, dependent: :destroy
    has_many :image_posts, dependent: :destroy 
    has_many :comments, foreign_key: :user_id, dependent: :destroy 
    has_many :text_comments, dependent: :destroy

    

    def is_seller?
      merchants.any?
    end
    
    def can_receive_payments?
      uid? &&  provider? && access_code? && publishable_key?
    end


    def url
        
        if current_user
            write_attribute :url, true
           else

            write_attribute :url, false
    end
      
    end  
    
    def mailboxer_email(object)
        email
    end

    def following?(leader)
        leaders.include? leader
    end


    def unfollow!(leader)
        leaders.destroy leader ##### VERY USEFULL!!!!
       
    end
    def follow!(leader)
        if leader != self && !following?(leader)
        leaders << leader
        else
            unfollow!leader
        
        end
    end


    def timeline_user_ids
        leader_ids + [id]
    end
    
    # def image= url
    #     self.url_image = url.original_filename
    # end

  end