module Api
  module V1
    class AuditoriasController < AccessPermissionsController
      before_action :autentica_admin

      def index
        @audits = audit_service.call
        render json: @audits
      end

      def show
        @audit = Audit.find(params[:id])
        render json: @audit
      end

      private

      def audit_service
        Audit::ListEvents.new params
      end
    end
  end
end
