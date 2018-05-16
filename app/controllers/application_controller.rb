class ApplicationController < ActionController::Base
     before_action :assign_env_variable
    protect_from_forgery with: :exception 
    alias_method :devise_current_user, :current_user


    # Overwriting the sign_out redirect path method
    def after_sign_out_path_for(resource)
      new_user_session_path
    end
  
    def assign_env_variable
      gon.stripe_key = ENV['STRIPE_PUBLISHABLE_KEY']
    end
    

    # Overwriting the sign_out redirect path method
    
    
    private

    def current_user
        if params[:user_id].blank?
          devise_current_user


        else
          User.find(params[:user_id])
        end   
      end
       
      helper_method :current_user

    def who_am_i
      user = @current_user.id
      @user= User.find(user)
    end

    def task_params
      params.require(:task).permit(:name, :email, :due_date, :term)
    end


    # def authenticate_user!
    #     redirect_to login_path unless current_user
    # end
    protected

   
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [ :name, :email, :url, :password, :password_confirmation, :avatar, :stripe_customer_id, :stripe_temporary_token, :provider ,:uid ,:publishable_key, :access_code])
      devise_parameter_sanitizer.permit(:sign_in, keys: [ :name, :email, :url, :password, :password_confirmation, :avatar, :stripe_customer_id, :stripe_temporary_token, :provider ,:uid ,:publishable_key, :access_code])
      
    end

    rescue_from ActiveRecord::RecordNotFound do
      flash[:warning] = 'Resource not found.'
      redirect_back_or root_path
    end
    
    def redirect_back_or(path)
      redirect_to request.referer || path
    end

end


