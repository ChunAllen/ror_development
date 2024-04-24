class ApiController < ActionController::API

  include ResponseHandler

  before_action :ensure_valid_key

  private

  def ensure_valid_key
    # @api_key = ApiKey.find_by(access_token: request.headers["HTTP_X_API_KEY"], is_active: true)

    # unless @api_key.present?
    #   render_unauthorized
    # end

    unless request.headers["HTTP_X_API_KEY"] == "2529b47a72155dc8e768"
      render_unauthorized
    end
  end

end