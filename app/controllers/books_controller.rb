class BooksController < ApplicationController
  def index
    # params[:search].present? ? @books = Book.where(:title =~ params[:search]) : @books = Book.all
    @books = Book.all
    if params[:loaned_out] == "true"
      @books = @books.select{ |book| book.loaned_out_at.present? }
    elsif params[:loaned_out] == "false"
      @books = @books.select{ |book| !book.loaned_out_at.present? }
    elsif params[:loaned_out] == "1234"
      @books
    else
      redirect_to books_path(loaned_out: false)
    end
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.save
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update_attributes(book_params)
    @book.save
    redirect_to books_path
  end

  def destroy
    @book = Book.find(params[:id]).destroy
    redirect_to books_path
  end

  def book_params
    params.require(:book).permit(:title, :description, :author, :edition, :year_of_release, :owner)

  end
end
