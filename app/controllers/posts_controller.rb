class PostsController < ApplicationController
    include CurrentCart
    before_action :set_cart
    before_action :authenticate_user!
     

    def index
        @user = current_user
                
        @all_posts = Post.all
        user_ids = current_user.timeline_user_ids
        post_ids = current_user.post_ids
        @posts = Post.where(user_id: user_ids).order("created_at DESC") + Comment.where(post_id: post_ids)
       
    end
    
    
    def show
        @post = Post.find(params[:id])
    end



end
