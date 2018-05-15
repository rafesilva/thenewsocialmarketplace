class StreamingController < ApplicationController
    before_action :authenticate_user!
    include CurrentCart
    before_action :set_cart
    

    def index
        @products = Product.order(:title)
        @users =  User.all
        @user = @current_user
    end

end
