module Api
  module V1
    class ConsultasController < AccessPermissionsController
      before_action :autentica_paciente
      before_action :find_paciente, only: [:index, :create]
      before_action :find_consulta, only: [:show, :update, :destroy]

      def index
        if @paciente.present? && @paciente.consultas.any?
          render json: @paciente.consultas, status: :ok
        else
          render json: { message: 'Nenhuma consulta encontrada' }, status: :ok
        end
      end

      def show
        render json: @consulta
      end

      def create
        @consulta = @paciente.consultas.build(consulta_params)
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

      def find_paciente
        @paciente = Paciente.find(params[:paciente_id])
      end

      def consulta_params
        params.require(:consulta).permit(
            :observacao,
            :data_marcacao,
            :estado,
            :tipo_consulta,
            :profissional_id,
            :unidade_medica_id
        )
      end
    end
  end
end