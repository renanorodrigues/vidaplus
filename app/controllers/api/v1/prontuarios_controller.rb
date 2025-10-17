module Api
  module V1
    class ProntuariosController < AccessPermissionsController
      before_action :autentica_profissional
      before_action :find_prontuario, only: [:show, :update, :destroy]

      def create
        prontuario = Prontuario.new(prontuario_params)

        if prontuario.valid?
          prontuario.save
          render json: prontuario, status: :created
        else
          render json: prontuario.errors, status: :unprocessable_content
        end
      end

      def show
        render json: @prontuario
      end

      def update
        if @prontuario.update(prontuario_params)
          render json: @prontuario
        else
          render json: @prontuario.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @prontuario.destroy!
        head :no_content
      end

      private

      def find_profissional
        @profissional = Profissional.find(params[:profissional_id])
      end

      def find_prontuario
        @prontuario = Prontuario.find(params[:id])
      end

      def prontuario_params
        params.require(:prontuario).permit(
          :observacao,
          :paciente_id,
          historico_clinico: [
            doencas: [],
            alergias: [],
            exames: [],
            medicacoes: []
          ]
        )
      end
    end
  end
end
