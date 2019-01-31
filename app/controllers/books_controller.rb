class BooksController < ApplicationController
  def new
    if logged_in?
      @book = Book.new
    else
redirect_to root_path
end
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @user = User.find(session[:user_id])
      @user.books << @book
      @book.save
      redirect_to @user
    end
  end


  def index
    if logged_in?
    @books = Book.all
  else
redirect_to root_path
end
  end

  def show
    if logged_in?
    @book=Book.find(params[:id])
    @related_posts = Book.where(category: @book.category_id)
  else
redirect_to root_path
end
  end

  def edit
    if logged_in?
    @book = Book.find(params[:id])

  else
    redirect_to root_path
  end
end

def update
  @book = Book.find(params[:id])

  if @book.update_attributes(book_params)
    redirect_to @book
  else
    render 'edit'
  end
end

def destroy
  @book = Book.find(params[:id])
  @book.destroy
  respond_to do |format|
    format.html
    format.js
  end
end
private

def book_params
  params.require(:book).permit(:title, :author, :description, :user_id, :category_id, :avatar)
end

end
