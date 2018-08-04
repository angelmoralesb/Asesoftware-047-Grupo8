class Api::V1::BaseController < ActionController::Base
  require 'json_web_token'
  def authenticate!
    auth_header = request.header['Authorization'] &&
    token = auth_header.split(' ').last &&
    json_web_token.decode(token)
  rescue
    nill
    end
    def invalid_authentication
        render json: { error: t('device.failure.unauthentication') }, status: :unauthorized
       
    end
end