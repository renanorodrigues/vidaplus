# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

usuario_admin = Usuario.find_or_create_by!(email: 'admin@vidaplus.com') do |u|
  u.password = 'senha123'
  u.password_confirmation = 'senha123'
  u.estado = :ativo
end

Administrador.find_or_create_by!(usuario: usuario_admin) do |a|
  a.nome_completo = 'João Silva Administrador'
  a.contato = '11987654321'
end

usuario_paciente = Usuario.find_or_create_by!(email: 'paciente@vidaplus.com') do |u|
  u.password = 'senha123'
  u.password_confirmation = 'senha123'
  u.estado = :ativo
end

Paciente.find_or_create_by!(usuario: usuario_paciente) do |p|
  p.nome_completo = 'Maria Santos Silva'
  p.rg = '123456789'
  p.cpf = '12345678901'
  p.endereco = 'Rua das Flores, 123, São Paulo - SP'
  p.sexo = 'Feminino'
  p.idade = 35
  p.contato = '11912345678'
  p.contato_emergencia = '11998765432'
end

usuario_profissional = Usuario.find_or_create_by!(email: 'profissional@vidaplus.com') do |u|
  u.password = 'senha123'
  u.password_confirmation = 'senha123'
  u.estado = :ativo
end

profissional = Profissional.find_or_create_by!(usuario: usuario_profissional) do |p|
  p.nome_completo = 'Dr. Carlos Alberto Souza'
  p.email_profissional = 'dr.carlos@vidaplus.com'
  p.contato = '11955556666'
  p.ocupacao = :medico
  p.especialidades_medicas = 'Cardiologia'
end

unidade_medica = UnidadeMedica.find_or_create_by!(cnpj: '12345678901') do |u|
  u.nome_fantasia = 'Clínica Vida Plus'
  u.endereco = 'Av. Paulista, 1000, São Paulo - SP'
end

Agenda.find_or_create_by!(profissional: profissional, unidade_medica: unidade_medica, data_inicio: Date.today) do |a|
  a.data_termino = Date.today + 7.days
  a.horarios = '08:00-12:00'
  a.estado = :ativado
end

Agenda.find_or_create_by!(profissional: profissional, unidade_medica: unidade_medica, data_inicio: Date.today + 8.days) do |a|
  a.data_termino = Date.today + 14.days
  a.horarios = ["dias_da_semana": ["Segunda", "Quarta", "Sexta"], "horarios": ["14:00", "18:00"], "duracao_min": "60"]
  a.estado = :pendente
end

Agenda.find_or_create_by!(profissional: profissional, unidade_medica: unidade_medica, data_inicio: Date.today + 15.days) do |a|
  a.data_termino = Date.today + 21.days
  a.horarios = ["dias_da_semana": ["Terça", "Quinta"], "horarios": ["09:00", "11:00"], "duracao_min": "30"]
  a.estado = :ativado
end
