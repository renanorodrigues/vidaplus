module Api
  module V1
    class UsuariosController < AccessPermissionsController
      before_action :autentica_admin
      before_action :find_usuario, only: %i[update destroy]

      def update
        if @usuario.update usuario_params
          render json: @usuario, status: :ok
        else
          render json: @usuario, status: :unprocessable_entity
        end
      end

      def destroy
        @usuario.destroy!
      end

      private

      def find_usuario
        @usuario = Usuario.find params[:id]
      end

      def usuario_params
        params.expect(usuario: %w[email password])
      end
    end
  end
end
