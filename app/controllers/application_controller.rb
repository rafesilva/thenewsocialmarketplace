class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception 
    alias_method :devise_current_user, :current_user

   
    def index
      @users = User.search(params[:name])

      @users = if params[:name]
        User.where('name LIKE ?', "%#{params[:name]}%")
      else
        User.all
      end
    end

    
    private

    def current_user
        if params[:user_id].blank?
          devise_current_user
          @current_user = devise_current_user
       
          
        
        else
          User.find(params[:user_id])
        end   
      end
    
       
      helper_method :current_user

    def who_am_i
      user = current_user.id
      @user= User.find(user)
    end
    def task_params
      params.require(:task).permit(:name, :email, :due_date, :term)
    end
    # def authenticate_user!
    #     redirect_to login_path unless current_user
    # end
end


