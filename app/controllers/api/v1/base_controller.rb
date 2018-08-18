class Api::V1::BaseController < ActionController::Base
  before_action :current_user

  require 'json_web_token'
  def authenticate!
    auth_header= request.header['Authorization']
    token     =auth_header.split(' ').last
    return true if JsonWebToken.decode(token)
  rescue
    render json: {error: "Error en la autenticacion,Token Errado"}
  end 
  
    def invalid_authentication
        render json: { error: t('device.failure.unauthentication') }, status: :unauthorized
       
    end
    private
    def current_user
      puts("***********")
      ingreso =decode_http[:id]

           
      @user ||= User.find(ingreso) 
      
      @current_user=ingreso
      puts(@current_user)
    end
    def decode_http
      auth_header= request.headers['Authorization']
      token=auth_header.split(' ').last
      JsonWebToken.decode(token)
    end
end