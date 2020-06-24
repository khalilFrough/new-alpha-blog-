class ApplicationController < ActionController::Base
    helper_method :current_user, :logged_in?
    def current_user
        @current_user ||= User.find(session[:user_id]) if session[:user_id] 
    end 

    def logged_in?
        !!current_user
        # in rails !! means you are turing a method to boolean
    end 

    def require_user
        if !logged_in?
            flash[:danger] = "You must logged in to perform that action"
            redirect_to login_path
        end 
    end 
end
