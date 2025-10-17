class AccessPermissionsController < ApplicationController
  include RolesHelper

  before_action :authenticate_user
  before_action :set_paper_trail_whodunnit

  %i[admin paciente profissional].each do |role|
    define_method("autentica_#{role}") do
      unless send("#{role}?")
        render json: { error: "Acesso negado" }, status: :forbidden
      else
        true
      end
    end
  end

  def current_user
    params[:session_user]
  end
end
