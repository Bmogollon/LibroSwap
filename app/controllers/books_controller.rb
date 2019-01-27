class BooksController < ApplicationController
  def new
      @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.valid?
      @user = User.find(session[:user_id])
      @user.books << @book
      @book.save
      redirect_to @book
    end
  end


  def index
    @books = Book.all
  end

  def show
    @book=Book.find(params[:id])
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


private

def book_params
  params.require(:book).permit(:title, :author, :description, :user_id, :category_id, :avatar)
end

end
