class CommentsController < ApplicationController

  def create
    @book = Book.find(params[:book_id])
    @comment = current_user.comments.new(comment_params)
    # 上の1行は下の2行と同じ意味で簡略化してコーディングしたもの
    # comment = Comment.new(comment_params)
    # comment.user_id = current_user.id
    @comment.book_id = @book.id
    if @comment.save
      redirect_to book_path(@book), notice: "You have commented book successfully."
    else
      @create_book = Book.new #_newform用
      render "books/show"
    end
  end

  def destroy
    Comment.find_by(id: params[:id], book_id: params[:book_id]).destroy
    redirect_to book_path(params[:book_id])
  end

  def follows
    
  end

  def followed
    
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end

end
