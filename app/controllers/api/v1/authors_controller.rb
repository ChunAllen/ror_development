module Api
  module V1
    class AuthorsController < ApiController

      before_action :prepare_author, only: [:update, :destroy]

      def index
        @authors = Author.all

        render status: 200, json: @authors
      end

      def create
        @author = Author.new(permitted_params)

        if @author.save
          render status: 200, json: Author.all
        else
          render_bad_request(@author.errors.full_messages.to_sentence)
        end
      end

      def update
        if @author.update(permitted_params)
          render status: 200, json: Author.all
        else
          render_bad_request(@author.errors.full_messages.to_sentence)
        end
      end

      def destroy
        if @author.destroy
          render status: 200, json: Author.all
        else
          render_bad_request(@author.errors.full_messages.to_sentence)
        end
      end

      private

      def permitted_params
        params.require(:author).permit(:name)
      end

      def prepare_author
        @author = Author.find params[:id]
      end

    end
  end
end