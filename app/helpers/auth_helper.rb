module AuthHelper
  require 'jwt'
  TOKEN_EXPIRATION_TIME = 60.minutes.from_now
  SECRET_KEY = Rails.application.credentials.secret_key_base

  def encode_token(user)
    token = JWT.encode(build_encode(user), SECRET_KEY, 'HS256')

    { token: token, exp: TOKEN_EXPIRATION_TIME }
  end

  def build_encode(user)
    {
      user_id: user.id,
      exp: TOKEN_EXPIRATION_TIME.to_i
    }
  end

  def decode_token(token)
    JWT.decode(token, SECRET_KEY)[0]
  end
end
