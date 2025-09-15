module Api
  module V1
    class ProntuariosController < ApplicationController
      before_action :find_paciente, only: :create

      def create
        prontuario = @paciente.prontuarios.build prontuario_params

        if prontuario.valid?
          prontuario.save
          render json: prontuario, status: :created
        else
          render json: prontuario.errors, status: :unprocessable_content
        end
      end

      private

      def find_paciente
        @paciente = Paciente.find params[:paciente_id]
      end

      def prontuario_params
        params.require(:prontuario).permit(:observacao, historico_clinico: [doencas: [], alergias: [], exames: [], medicacoes: []])
      end
    end
  end
end
