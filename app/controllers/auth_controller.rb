class AuthController < ApplicationController
  def signin
    result = auth_service.call

    render json: { info: result }, status: :ok
  end

  private

  def auth_service
    Auth::Signin.new(params)
  end
end
