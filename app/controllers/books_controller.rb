class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end

def show
  @book = Book.find(params[:id])
  @new_book = Book.new
end

def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id

    if @book.save
      redirect_to book_path(@book),
        notice: "You have created book successfully."
    else
      @books = Book.all
      render :index, status: :unprocessable_entity
    end
end


def edit
  @book = Book.find(params[:id])

  if @book.user != Current.user
    redirect_to books_path, alert: "You cannot edit this book."
  end
end

def update
  @book = Book.find(params[:id])

  if @book.user != Current.user
    return redirect_to books_path, alert: "You cannot edit this book."
  end

  if @book.update(book_params)
    redirect_to book_path(@book),
                notice: "You have updated book successfully."
  else
    render :edit, status: :unprocessable_entity
  end
end

def destroy
  @book = Book.find(params[:id])

  if @book.user != Current.user
    return redirect_to books_path, alert: "You cannot delete this book."
  end

  @book.destroy
  redirect_to books_path
end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
