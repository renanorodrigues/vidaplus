module Api
  module V1
    class ConsultasController < AccessPermissionsController
      before_action :autentica_paciente
      before_action :find_consulta, only: [:show, :update, :destroy]

      def index
        @consultas = Consulta.all
        render json: @consultas
      end

      def show
        render json: @consulta
      end

      def create
        @consulta = Consulta.new(consulta_params)
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

      def destroy
        @consulta.destroy!
        head :no_content
      end

      private

      def find_consulta
        @consulta = Consulta.find(params[:id])
      end

      def consulta_params
        params.require(:consulta).permit(
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