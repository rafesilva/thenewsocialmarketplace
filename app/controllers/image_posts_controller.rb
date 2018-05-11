class ImagePostsController < ApplicationController
    
    before_action :authenticate_user!
    protect_from_forgery 
    include CurrentCart
    before_action :set_cart

    def new
        @image_post = ImagePost.new
    end

    def create
        @image_post = current_user.image_posts.build(image_post_params)
        @image_post.save
        redirect_to posts_url

    end

    def show
        @image_post = Post.find(params[:id])
    end
    private

    def image_post_params
        params.require(:image_post).permit(:title, :body, :url)

    end
end
