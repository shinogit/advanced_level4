class BooksController < ApplicationController

  before_action :ensure_correct_user,{only: [:edit,:update,:destroy]}

  def show
    @book = Book.find(params[:id])
    @create_book = Book.new
    @comment = Comment.new
  end

  def index
    # @book = Book.find(params[:id])
    @books = Book.all
    @new_book = Book.new
  end

  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      redirect_to book_path(@new_book), notice: "You have created book successfully."
    else
      @books = Book.all
      render "index"
    end
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully."
    else
      render "edit"
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      flash[:notice] = "権限がありません"
    redirect_to books_path
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

  
end
