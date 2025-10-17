module Api
  module V1
    class ReceitasController < AccessPermissionsController
      before_action :autentica_profissional, only: [:create, :update, :destroy]
      before_action :find_receita, only: [:show, :update, :destroy]

      def create
        profissional = find_profissional
        receita = profissional.receitas.build(receita_params)

        if receita.valid?
          receita.save
          render json: receita, status: :created
        else
          render json: receita.errors, status: :unprocessable_content
        end
      end

      def show
        if paciente_da_receita? || autentica_profissional
          render json: @receita, status: :ok
        else
          head :forbidden
        end
      end

      def update
        if @receita.update(receita_params)
          render json: @receita
        else
          render json: @receita.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @receita.destroy!
        head :no_content
      end

      private

      def find_profissional
        Profissional.find(params[:profissional_id])
      end

      def find_receita
        @receita = Receita.find(params[:id])
      end

      def paciente_da_receita?
        return false if current_user.paciente.nil?

        @receita.paciente_id == current_user.paciente.id
      end

      def receita_params
        params.require(:receita).permit(
          :observacao,
          :paciente_id,
          prescricao: [
            :medicamento,
            :dosagem,
            :frequencia,
            :duracao,
            :via
          ]
        )
      end
    end
  end
end
