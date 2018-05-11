class UsersController < ApplicationController
    
    #  before_action :authenticate_user!, only: [:follow, :index, :show] 
    include CurrentCart
    before_action :set_cart 
    
        
            def index
                @users = User.all
                user = current_user.id
                @user= User.find(user)

            end

            def show
                
            end
            
            def edit
                @user = User.find(params[:id])
                
            end

            def update
                @user = User.find(params[:id])
                respond_to do |format|
                    if @user.update(user_params)
                        format.html { redirect_to @user, notice: 'User was successfully updated.' }
                    else
                        format.html { render :edit }
                    end                
                end
            end

            def destroy
                 User.find(params[:id]).destroy
                
                redirect_to users_url

            end

            def new
                @user = User.new
                upload
                redirect_to users_url
               
            end

            def create
                @user = User.new(user_params)
                upload
                
                if @user.save
                    redirect_to streaming_index_url, notice: "Welcome to The New Social MarketPlace! We sent you an email, please check your email box."
                else
                    redirect_to @user
            end 
        end

            def follow
                @user = User.find(params[:id])
                if current_user.follow!(@user)
                    if  current_user.following?(@user) 
              redirect_to @user, notice: "Follow successful!"
                    else
                    redirect_to @user, notice: "Unfollowed! Babe!"
                    end       
              
                elsif current_user.following?(@user) 
                    redirect_to @user, notice: "You already are following this guy!"
                else
              redirect_to @user, alert: "Hey. (Are you trying to follow yourself? Why?)"
                end
          end

          
    private
            def user_params
                params.require(:user).permit( :name, :email, :url, :password, :password_confirmation, :avatar)
            end

            def upload
                # uploaded_io = user_params[:url]
                # File.open(Rails.root.join('public', 'users', uploaded_io.original_filename), 'wb') do |file|
                #   file.write(uploaded_io.read)
                # end
            
                @user.avatar

            end
           
            def default_avatar
                image_src = File.join(Rails.root, 'tmp/540222972.jpg')
                    src_file = File.new(image_src)
                    @user.avatar = src_file
            end
        end
