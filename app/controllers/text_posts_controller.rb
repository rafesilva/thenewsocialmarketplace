class TextPostsController < ApplicationController
    protect_from_forgery 
    before_action :authenticate_user!
    include CurrentCart
    before_action :set_cart

    def new
        @text_post = TextPost.new
    end

    def create
        @text_post = current_user.text_posts.build(text_post_params)
        @text_post.save
        redirect_to posts_url
    end

    def show
        @text_post = Post.find(params[:id])
        
    end
    
    private

    def text_post_params
        params.require(:text_post).permit(:title, :body)

    end
end
