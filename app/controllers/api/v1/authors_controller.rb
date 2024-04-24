module Api
  module V1
    class AuthorsController < ApiController

      def index
        @authors = Author.all

        render status: 200, json: @authors
      end

    end
  end
end