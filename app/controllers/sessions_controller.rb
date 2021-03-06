class SessionsController < ApplicationController

    def home
    end 

    def new
    end

     def create
        @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user) #/users/#{user.id}
            else
                flash[:message] = "Invalid email or password. Please try again."
                redirect_to "/login"
            end  
    end 

    def destroy
        session.clear
        redirect_to root_path
    end  

    def omniauth
        @user = User.from_omniauth(auth)
        if @user.save
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            redirect_to "/login"
        end
    end

      private
        def auth
            request.env['omniauth.auth']
        end
end
