class UsersController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      log_in @user
      redirect_to @user
    end
  end

  def index
    # if logged_in?
      @user = User.all
    # else
    #   redirect_to root_path
    # end
  end

  def show
    @user = User.find(params[:id])
    @user_books = Book.where(user_id: @user)
  end


  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(user_params)
      redirect_to @user
    else
      puts @user.errors.details
      render 'edit'
    end

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :avatar)
  end
end
