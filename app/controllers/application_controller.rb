class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?

    private 
    def current_user
        @current_user ||=  User.find_by_id(session[:user_id]) if session[:user_id] 
    end 

    def logged_in?
        !!session[:user_id] 
    end 

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end 

    def redirect_if_not_owner
        if current_user == nil || current_user.id != session[:user_id]
          flash[:alert] = "Unauthorized access. Please login to view this page."
          redirect_to '/'
        end
      end 
end
