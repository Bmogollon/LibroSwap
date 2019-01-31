class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def new
    @user = User.new
    render :layout => false
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
      @user = User.all

  end

  def show
    @user = User.find(params[:id])
    @user_books = Book.where(user_id: @user)
    render :layout => false
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

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    respond_to do |format|
      format.js
    end
  end



  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :agreement,:avatar)
  end
end
