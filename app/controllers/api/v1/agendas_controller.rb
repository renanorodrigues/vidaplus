module Api
  module V1
    class AgendasController < ApplicationController
      before_action :find_agenda, only: %i[show update destroy]

      def index
        @agendas = Agenda.all

        render json: @agendas, status: :ok
      end

      def create
        @agenda = Agenda.new agenda_params

        if @agenda.valid?
          @agenda.save
          render json: @agenda, status: :created
        else
          render json: @agenda.errors, status: :unprocessable_content
        end
      end

      def show; end

      def update
        if @agenda.update(agenda_params)
          render json: @agenda, status: :ok
        else
          render json: @agenda, status: :unprocessable_content
        end
      end

      def destroy
        @agenda.destroy
      end

      private

      def find_agenda
        @agenda = Agenda.find params[:id]
      end

      def agenda_params
        params.require(:agenda).permit(:data_inicio, :data_termino, :observacao, :estado, :profissional_id, :unidade_medica_id, horarios: [dias_da_semana: [], horarios: [], duracao_agenda_minutos: []])
      end
    end
  end
end
