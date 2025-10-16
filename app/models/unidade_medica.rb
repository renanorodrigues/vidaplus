class UnidadeMedica < ApplicationRecord
  has_many :pacientes
  has_many :profissionais, through: :profissional_unidade_medicas
  has_many :consultas
  has_many :agendas
  has_paper_trail

  validates :nome_fantasia, :endereco, presence: :true
  validates :cnpj, presence: true, uniqueness: true, length: { is: 11 }
end
