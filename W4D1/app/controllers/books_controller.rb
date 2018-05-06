class BooksController < ApplicationController
  def index
    # your code here
    @books = Book.all
    render index: @books
  end

  def new
    # your code here
  end

  def create
    # your code here
    book = Book.new(book_params)
    book.save
    redirect_to books_url
  end

  def destroy
    # your code here
    Book.find(params[:id]).destroy
    redirect_to books_url
  end

  private
  def book_params
    params.require(:book).permit(:title, :author)
  end
end
