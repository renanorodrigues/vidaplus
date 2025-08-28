module AuthHelper
  require 'jwt'
  TOKEN_EXPIRATION_TIME = 15.minutes.from_now

  def encode_token(user)
    token = JWT.encode(build_encode(user), ENV['JWT_SECRET'], 'HS256')

    { token: token, exp: TOKEN_EXPIRATION_TIME }
  end

  def build_encode(user)
    {
      user_id: user.id,
      exp: TOKEN_EXPIRATION_TIME.to_i
    }
  end

  def decode_token
    JWT.decode(token, ENV['JWT_SECRET'])[0]
  end
end
