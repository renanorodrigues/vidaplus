module RolesHelper
  def admin?(usuario)
    usuario.administrador.present?
  end

  def profissional?(usuario)
    usuario.profissional.present?
  end

  def paciente?(usuario)
    usuario.paciente.present?
  end
end
