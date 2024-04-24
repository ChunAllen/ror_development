class BooksController < ApplicationController

  before_action :prepare_author

  def index
    @books = @author.books
  end

  def new
    @book = @author.books.new
  end

  def create
    @book = @author.books.new(permitted_params)

    if @book.save
      redirect_to author_books_path(@author.id)
    else
      render :new
    end
  end

  def edit
    @book = @author.books.find(params[:id])
  end

  def update
    if @author.books.update(permitted_params)
      redirect_to author_books_path(@author.id)
    else
      render :edit
    end
  end

  def destroy
    @book = @author.books.find(params[:id])

    if @book.destroy
      redirect_to author_books_path(@author.id)
    else
      flash.now[:error] = @book.errors.full_messages.to_sentence
    end
  end


  private

  def permitted_params
    params.require(:book).permit(:title, :description)
  end

  def prepare_author
    @author = Author.find(params[:author_id])
  end

end
