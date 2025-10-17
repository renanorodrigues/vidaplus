module Api
  module V1
    class AgendasController < AccessPermissionsController
      before_action :autentica_profissional
      before_action :find_profissional, only: %i[index create]
      before_action :find_agenda, only: %i[show update destroy]

      def index
        @agendas = @profissional.agendas
        render json: @agendas, status: :ok
      end

      def create
        agenda = @profissional.agendas.new(agenda_params)

        if agenda.valid?
          agenda.save
          render json: agenda, status: :created
        else
          render json: agenda.errors, status: :unprocessable_content
        end
      end

      def show
        render json: @agenda, status: :ok
      end

      def update
        validate_agenda_by_profissional
        if @agenda.update(agenda_params)
          render json: @agenda, status: :ok
        else
          render json: @agenda, status: :unprocessable_content
        end
      end

      def destroy
        validate_agenda_by_profissional
        @agenda.destroy
      end

      private

      def validate_agenda_by_profissional
        unless @agenda.profissional.usuario_id == current_user.id
          render json: { error: 'Acesso negado' }, status: :forbidden
        end
      end

      def find_profissional
        @profissional = Profissional.find params[:profissional_id]
      end

      def find_agenda
        @agenda = Agenda.find params[:id]
      end

      def agenda_params
        params.require(:agenda).permit(
          :data_inicio,
          :data_termino,
          :observacao,
          :estado,
          :profissional_id,
          :unidade_medica_id,
          horarios: [
            dias_da_semana: [],
            horarios: [],
            duracao_agenda_minutos: []
          ]
        )
      end
    end
  end
end
