class StreamingController < ApplicationController
    include CurrentCart
    before_action :set_cart
 before_action :authenticate_user!, only: [:follow, :index] 

    def index
        @products = Product.order(:title)
        @users =  User.all
        @user = current_user
    end

end
