module Auth
  class Signup
    include AuthHelper

    def initialize(params)
      @params = params
    end

    def call
      already_has_user_with_this_email?
      user = create_user
      encode_token(user)
    rescue StandardError => e
      { error: e.message, status_code: 400 }
    rescue Exception => e
      { error: e.message, status_code: 500 }
    end

    private

    def already_has_user_with_this_email?
      user = Usuario.find_by_email(@params[:email])
      raise StandardError, 'email já cadastrado' if user.present?
    end

    def create_user
      user = Usuario.new(sanitize_params)
      return user if user.save!
      raise StandardError, "não foi possível cadastrar o usuário: #{user.errors}"
    end

    def sanitize_params
      @params.slice(:email, :password)
    end
  end
end
