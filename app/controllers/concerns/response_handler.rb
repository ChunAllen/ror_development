# frozen_string_literal: true

module ResponseHandler
  extend ActiveSupport::Concern

  def render_unauthorized
    generate_response(status: 401, name: "UNAUTHORIZED", message: "You are not authorized to access this API")
  end

  def render_bad_request(message)
    generate_response(status: 400,
                      name: "BAD REQUEST",
                      message: message)
  end


  private

  def generate_response(status:, name:, message: "")
    response = { code: status, name: name, message: message }

    render status: status, json: response
  end
end
