module Auth
  class Signin
    include AuthHelper

    def call
      find_user
      authenticate
    end

    private

    def authenticate
      if @user&.authenticate(@params[:password])
        encode_token(@user)
      else
        raise 'senha ou email inválidos'
      end
    end

    def find_user
      @user = Usuario.find_by_email @params[:email]
    end
  end
end