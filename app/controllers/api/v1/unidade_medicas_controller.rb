module Api
  module V1
    class UnidadeMedicasController < AccessPermissionsController
      before_action :autentica_admin
      before_action :find_unidade_medica, only: %i[show update destroy]

      def index
        @unidade_medicas = UnidadeMedica.all

        render json: @unidade_medicas, status: :ok
      end

      def create
        @unidade_medica = UnidadeMedica.new unidade_medica_params

        if @unidade_medica.valid?
          @unidade_medica.save
          render json: @unidade_medica, status: :created
        else
          render json: @unidade_medica.errors, status: :unprocessable_content
        end
      end

      def show; end

      def update
        if @unidade_medica.update(unidade_medica_params)
          render json: @unidade_medica, status: :ok
        else
          render json: @unidade_medica, status: :unprocessable_content
        end
      end

      def destroy
        @unidade_medica.destroy
      end

      private

      def find_unidade_medica
        @unidade_medica = UnidadeMedica.find params[:id]
      end

      def unidade_medica_params
        params.require(:unidade_medica).permit(:nome_fantasia, :cnpj, endereco: [:rua, :numero, :bairro, :cidade, :estado, :cep])
      end
    end
  end
end
