module Api
  module V1
    class ProfissionaisController < AccessPermissionsController
      before_action :autentica_admin
      before_action :find_profissional, only: %i[show update destroy]

      def index
        @profissionais = Profissional.all

        render json: @profissionais, status: :ok
      end

      def create
        @profissional = Profissional.new profissional_params

        if @profissional.valid?
          @profissional.save
          linked_profissional_to_unidade_medica
          render json: @profissional, status: :created
        else
          render json: @profissional.errors, status: :unprocessable_content
        end
      end

      def show; end

      def update
        if @profissional.update(profissional_params)
          render json: @profissional, status: :ok
        else
          render json: @profissional, status: :unprocessable_content
        end
      end

      def destroy
        @profissional.destroy
      end

      private

      def linked_profissional_to_unidade_medica
        return if params[:unidade_medica_id].blank?

        ProfissionalUnidadeMedica.find_or_create_by(unidade_medica_id: params[:unidade_medica_id], profissional_id: @profissional.id)
      end

      def find_profissional
        @profissional = Profissional.find params[:id]
      end

      def profissional_params
        params.require(:profissional).permit(:nome_completo, :contato, :email_profissional, :usuario_id, :unidade_medica_id, :biografia, :ocupacao, especialidades_medicas: [:especialidade, :observacao])
      end
    end
  end
end
