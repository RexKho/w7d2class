class SessionsController < ApplicationController

    def new 
        @user = User.new 
        render :new 
    end

    def create 
        incomming_username = params[:user][:username] 
        incomming_password = params[:user][:password]
        @user = User.find_by_credentials(incomming_username, incomming_password)
        if @user 
            login(@user)
            redirect_to users_url(@user) 

        else 
            render :new 
        end 
    end

    def destroy 
        logout
        redirect_to new_session_url
    end

end