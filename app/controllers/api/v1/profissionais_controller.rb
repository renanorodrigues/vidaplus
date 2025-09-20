module Api
  module V1
    class ProfissionaisController < ApplicationController
      before_action :find_profissional, only: %i[show update destroy]

      def index
        @profissionais = Profissional.all

        render json: @profissionais, status: :ok
      end

      def create
        @profissional = Profissional.new profissional_params

        if @profissional.valid?
          @profissional.save
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

      def find_profissional
        @profissional = Profissional.find params[:id]
      end

      def profissional_params
        params.require(:profissional).permit(:nome_completo, :contato, :email_profissional, :usuario_id, :biografia, :ocupacao, especialidades_medicas: [:especialidade, :observacao])
      end
    end
  end
end
