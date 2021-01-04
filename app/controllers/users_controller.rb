class UsersController < ApplicationController
    
    def self.from_omniauth(auth)
        where(email: auth.info.email).first_or_initialize do |user|
          user.name = auth.info.name
          user.email = auth.info.email
        end
      end

    def new
        @user = User.new
    end 

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else 
            flash[:message] = "Invalid Email or Password. Please try again"
            redirect_to '/signup'
        end 
    end 
 
    def show
        @user = User.find_by(id: params[:id])
        redirect_to '/' if !@user
    end 

    private

        def user_params
            params.require(:user).permit(:username, :email, :password)
        end 

end