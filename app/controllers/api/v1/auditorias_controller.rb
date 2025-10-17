module Api
  module V1
    class AuditoriasController < AccessPermissionsController
      before_action :autentica_admin

      def index
        @audits = audit_service.call
        render json: @audits, status: :ok
      end

      def show
        @audit = audit_service.call
        render json: @audit, status: :ok
      end

      private

      def audit_service
        Auditoria::SearchEventos.new params
      end
    end
  end
end
