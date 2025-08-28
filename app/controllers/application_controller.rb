class ApplicationController < ActionController::API
  include AuthHelper

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = decode_token(token)
    user_id = decoded_token['user_id']
    user = Usuario.find_by id: user_id
    request.params.merge!(session_user: user)
  rescue JWT::ExpiredSignature
    render json: { error: "token expirado" }, status: 403
  rescue JWT::DecodeError
    render json: { error: "token inválido" }, status: 403
  end
end
