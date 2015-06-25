class UsersController < ApplicationController

    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def edit
      @user = User.find(params[:id])
    end

    def update
      @user = User.find(params[:id])
      if @user.update_attributes(params.require(:user).permit(:first_name, :last_name, :phone1, :phone2, :address, :email, :encrypted_password))
        redirect_to user_url(@user), notice: 'Updated A System User'
      else
        render :edit
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(params.require(:user).permit(:first_name, :last_name, :phone1, :phone2, :address, :email, :encrypted_password))
      if @user.save
        redirect_to user_url(@user), notice: 'Created A New System User'
      else
        render :new
      end
    end


end
