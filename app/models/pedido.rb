class Pedido < ApplicationRecord
  belongs_to :paciente
  belongs_to :profissional
  belongs_to :unidade_medica
  has_paper_trail

  enum :estado, { pendente: 0, confirmado: 1, cancelado: 2 }
  enum :tipo_consulta, { presencial: 0, teleconsulta: 1 }

  validates :observacao, length: { maximum: 255 }
  validates :data_marcacao, presence: true
  validates :estado, presence: true
  validates :tipo_consulta, presence: true
end
