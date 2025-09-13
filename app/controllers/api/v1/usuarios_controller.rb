module Api
  module V1
    class UsuariosController < ApplicationController
      # TODO: Implementa depois a autenticação
      #before_action :authenticate_user

      def create
        @usuario = Usuario.new usuario_params

        if @usuario.save
          render json: @usuario, status: :created
        else
          render json: @usuario, status: :unprocessable_entity
        end
      end

      def show
        render json: { user: find_user_data }, status: :ok
      end

      private

      def find_user_data
        params[:session_user].slice(:primeiro_nome, :email, :created_at)
      end

      def usuario_params
        params.expect(usuario: %w[primeiro_nome email password])
      end
    end
  end
end
