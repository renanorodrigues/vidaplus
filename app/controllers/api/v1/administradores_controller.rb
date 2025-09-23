module Api
  module V1
    class AdministradoresController < ApplicationController
      # TODO: Implementar autenticação futuramente
      # before_action :authenticate_user
      before_action :set_administrador, only: %i[ show update destroy ]

      def index
        @administradores = Administrador.all
        render json: @administradores
      end

      def show
        render json: @administrador
      end

      def create
        @administrador = Administrador.new(administrador_params)

        if @administrador.save
          render json: @administrador, status: :created
        else
          render json: @administrador.errors, status: :unprocessable_entity
        end
      end

      def update
        if @administrador.update(administrador_params)
          render json: @administrador, status: :ok
        else
          render json: @administrador.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @administrador.destroy
        head :no_content
      end

      private

      def set_administrador
        @administrador = Administrador.find(params[:id])
      end

      def administrador_params
        params.require(:administrador).permit(:nome_completo, :contato, :usuario_id)
      end
    end
  end
end
