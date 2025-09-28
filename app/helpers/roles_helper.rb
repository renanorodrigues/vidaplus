module RolesHelper
  def admin?
    current_user.administrador.present?
  end

  def profissional?
    current_user.profissional.present?
  end

  def paciente?
    current_user.paciente.present?
  end
end
