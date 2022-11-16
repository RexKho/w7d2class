class UsersController < ApplicationController 

    def show 
        @user = User.find_by(id: params[:id])
        render :show 
    end

    def index
        @user = User.all 
        render :index 
    end

    def new 
        @user = User.new 
        render :new 
    end

    # def edit 
    #     @user = User.find_by(id: params[:id])
    #     render :edit 
    # end

    def create 
        @user = User.new(user_params)
        if @user.save!
            redirect_to user_url(@user)
        else
            redirect_to new_user_url 

        end
    end





    private 

    def user_params 
        params.require(:user).permit(:email, :password)
    end

end