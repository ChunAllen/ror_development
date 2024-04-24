class AuthorsController < ApplicationController

  before_action :prepare_author, only: [:edit, :update, :destroy]

  def index
    @authors = Author.order(:name)
  end

  def new
    @author = Author.new
  end

  def create
    @author = Author.new(permitted_params)

    if @author.save
      redirect_to authors_path, notice: "Author has been created"
    else
      flash.now[:error] = @author.errors.full_messages.to_sentence
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @author.update(permitted_params)
      redirect_to authors_path
    else
      flash.now[:error] = @author.errors.full_messages.to_sentence
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @author.destroy
      redirect_to authors_path, notice: "Author #{@author.name} has been deleted"
    else
      redirect_to authors_path, alert: @author.errors.full_messages.to_sentence
    end
  end

  private

  def permitted_params
    params.require(:author).permit(:name)
  end

  def prepare_author
    @author = Author.find(params[:id])
  end

end
