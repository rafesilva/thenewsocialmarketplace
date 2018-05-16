class TasksController < ApplicationController
    include CurrentCart
    before_action :set_cart

        def index
            @user = User.all
            @user = User.search(params[:name])
        end
    end
        
        

   

      