module Api
  module V1
    class ConsultasController < AccessPermissionsController
      before_action :autentica_paciente, only: [:index, :show, :create]
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
        if permissao_de_alteracao?
          @consulta.update(consulta_params)
          render json: @consulta, status: :ok
        else
          render json: @consulta.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @consulta.destroy!
        head :no_content
      end

      private

      def permissao_de_alteracao?
        return true if params[:profissional_id].to_i == @consulta.profissional_id
        return true if params[:paciente_id].to_i == @consulta.paciente_id

        false
      end

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