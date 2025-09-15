module Api
  module V1
    class PacientesController < ApplicationController
      # TODO: Implementa depois a autenticação
      #before_action :authenticate_user
      before_action :set_paciente, only: %i[ show update destroy ]

      def index
        @pacientes = Paciente.all
      end
    
      def show; end
    
      def create
        @paciente = Paciente.new paciente_params

        if @paciente.valid?
          @paciente.save
          render json: @paciente, status: :created
        else
          render json: @paciente.errors, status: :unprocessable_content
        end
      end
    
      def update
        if @paciente.update(paciente_params)
          render json: @paciente, status: :ok
        else
          render json: @paciente, status: :unprocessable_content
        end
      end
    
      def destroy
        @paciente.destroy
      end
    
      private

      def set_paciente
        @paciente = Paciente.find params[:id]
      end
  
      def paciente_params
        params.require(:paciente).permit(:nome_completo, :rg, :cpf, :sexo, :idade, :contato, :contato_emergencia, :usuario_id, :prontuario_id, endereco: [:rua, :numero, :bairro, :cidade, :estado, :cep])
      end
    end
  end
end
