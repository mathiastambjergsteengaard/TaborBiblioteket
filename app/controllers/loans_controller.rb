class LoansController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
  end

  def update
    @book = Book.find(params[:id])
    @book.loaner = params[:book][:loaner]
    @book.loaned_out_at = Date.today
    @book.save
    redirect_to books_path(loaned_out: "false")
  end

  def destroy
    @book = Book.find(params[:id])
    @book.loaner = nil
    @book.loaned_out_at = nil
    @book.save
    redirect_to books_path(loaned_out: "true")
  end
end
