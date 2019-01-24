class UsersController < ApplicationController
  def new
    @user = User.new

  end

  def create
    @user  = User.new(user_params)
    @user.save
    redirect_to @users
  end


  def index
    @user= User.all
  end

  def show
      @user = User.find(params[:id])
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:first_name,:last_name, :password, :password_confirmation,:email)
  end

end
