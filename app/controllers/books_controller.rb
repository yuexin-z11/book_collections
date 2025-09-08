class BooksController < ApplicationController
  before_action :set_book, only: %i[show edit update destroy]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path, notice: 'Book was successfully created.'
    else
      render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    if @book.update(book_params)
      redirect_to root_path, notice: 'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @book.destroy
    redirect_to root_path, notice: 'Book was successfully deleted.'
  end

  def confirm_destroy
    @book = Book.find(params[:id])
  end


  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title)
    # params.require(:book).permit(:title, :author, :price, :published_date)
  end

end
