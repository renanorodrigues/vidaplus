module Auth
  class Signin
    include AuthHelper

    def initialize(params)
      @params = params
    end

    def call
      find_user
      authenticate
    rescue StandardError => e
      { error: e.message, status_code: 400 }
    rescue Exception => e
      { error: e.message, status_code: 500 }
    end

    private

    def authenticate
      if @user&.authenticate(@params[:password])
        encode_token(@user)
      else
        raise StandardError, 'senha ou email inválidos'
      end
    end

    def find_user
      @user = Usuario.find_by_email @params[:email]
    end
  end
end