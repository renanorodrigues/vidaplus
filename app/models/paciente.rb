class Paciente < ApplicationRecord
  belongs_to :usuario
  has_many :prontuarios
  has_many :receitas
  has_many :pedidos
  has_paper_trail

  validates :nome_completo, presence: true, length: { minimum: 2 }
  validates :rg, presence: true, uniqueness: true, length: { minimum: 8 }
  validates :cpf, length: { is: 11 }
  validates :endereco, :sexo, :idade, :contato, :contato_emergencia, presence: true
end
