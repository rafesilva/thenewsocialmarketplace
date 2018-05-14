class StreamingController < ApplicationController
    include CurrentCart
    before_action :set_cart
    before_action :authenticate_user!

    def index
        @products = Product.order(:title)
        @users =  User.all
        @user = @current_user
    end

end
