module Api
  module V1
    class BooksController < ApiController

      before_action :prepare_author, only: [:create]

      def create
        @book = @author.books.new(permitted_params)
        
        if @book.save
          render status: 200, json: Author.all
        else
          render_bad_request(@author.errors.full_messages.to_sentence)
        end
      end

      private

      def permitted_params
        params.require(:book).permit(:title, :description)
      end

      def prepare_author
        @author = Author.find params[:author_id]
      end

    end
  end
end