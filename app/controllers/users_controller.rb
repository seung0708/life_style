class UsersController < ApplicationController

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:message] = "
                Password must have at least 8 characters
                Password must have at least one number
                Password must have at least one lowercase letter
                Password must have at least one uppercase letter
            "
            redirect_to '/signup'
        end 
    end 

    def show
        redirect_if_not_logged_in
        @user = User.find(params[:id])
        redirect_to '/' if !@user
    end 

    private

        def user_params
            params.require(:user).permit(:username, :email, :password)
        end 

end