class Profissional < ApplicationRecord
  belongs_to :usuario
  has_many :agendas
  has_many :receitas
  has_many :unidade_medicas, through: :profissional_unidade_medicas
  has_paper_trail

  validates :nome_completo, :contato, :ocupacao, :especialidades_medicas, presence: true
  validates :email_profissional, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true

  enum :ocupacao, { medico: 0, enfermeiro: 1, tecnico: 2, administrativo: 3, outro: 4 }
end
