class AuthController < ApplicationController
  def signin
    result = signin_auth_service.call

    render_result result
  end

  def signup
    result = signup_auth_service.call

    render_result result
  end

  private

  def signin_auth_service
    Auth::Signin.new params
  end

  def signup_auth_service
    Auth::Signup.new params
  end
end
