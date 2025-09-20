module Api
  module V1
    class PedidosController < ApplicationController
      before_action :find_pedido, only: [:show, :update, :destroy]

      def index
        @pedidos = Pedido.all
        render json: @pedidos
      end

      def show
        render json: @pedido
      end

      def create
        @pedido = Pedido.new(pedido_params)
        if @pedido.save
          render json: @pedido, status: :created
        else
          render json: @pedido.errors, status: :unprocessable_entity
        end
      end

      def update
        if @pedido.update(pedido_params)
          render json: @pedido
        else
          render json: @pedido.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @pedido.destroy
        head :no_content
      end

      private

      def find_pedido
        @pedido = Pedido.find(params[:id])
      end

      def pedido_params
        params.require(:pedido).permit(
            :observacao,
            :data_marcacao,
            :estado,
            :tipo_consulta,
            :paciente_id,
            :profissional_id,
            :unidade_medica_id
        )
      end
    end
  end
end