module Api
  module V1
    class ConsultasController < ApplicationController
      before_action :set_pedido
      before_action :set_consulta, only: [:show, :update]

      def show
        render json: @consulta
      end

      def create
        @consulta = @pedido.consultas.build(consulta_params)
        if @consulta.save
          render json: @consulta, status: :created
        else
          render json: @consulta.errors, status: :unprocessable_entity
        end
      end

      def update
        if @consulta.update(consulta_params)
          render json: @consulta
        else
          render json: @consulta.errors, status: :unprocessable_entity
        end
      end

      private

      def set_pedido
        @pedido = Pedido.find(params[:pedido_id])
      end

      def set_consulta
        @consulta = Consulta.find(params[:id])
      end

      def consulta_params
        params.require(:consulta).permit(:link, :estado, :duracao)
      end
    end
  end
end
