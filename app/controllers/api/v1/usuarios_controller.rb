module Api
  module V1
    class UsuariosController < ApplicationController
      # TODO: Implementa depois a autenticação
      #before_action :authenticate_user
      before_action :set_usuario, only: %i[update destroy]

      def create
        @usuario = Usuario.new usuario_params

        if @usuario.save
          render json: @usuario, status: :created
        else
          render json: @usuario, status: :unprocessable_entity
        end
      end

      def update
        if @usuario.update usuario_params
          render json: @usuario, status: :ok
        else
          render json: @usuario, status: :unprocessable_entity
        end
      end

      def destroy
        @usuario.destroy!
      end

      private

      def set_usuario
        @usuario = Usuario.find params[:id]
      end

      def usuario_params
        params.expect(usuario: %w[email password])
      end
    end
  end
end
