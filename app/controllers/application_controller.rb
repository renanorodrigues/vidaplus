class ApplicationController < ActionController::API
  include AuthHelper

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    decoded_token = decode_token(token)
    usuario_id = decoded_token['usuario_id']
    usuario = Usuario.find_by id: usuario_id
    request.params.merge!(session_user: usuario)
  rescue JWT::ExpiredSignature
    render json: { error: "token expirado" }, status: 403
  rescue JWT::DecodeError
    render json: { error: "token inválido" }, status: 403
  end

  def render_result(result)
    if result.is_a?(Hash) && result[:error]
      render json: { error: result[:error] }, status: result[:code]
    else
      render json: result
    end
  end

  def params
    request.params
  end
end
