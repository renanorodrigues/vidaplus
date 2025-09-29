class Consulta < ApplicationRecord
  belongs_to :pedido
  has_paper_trail

  enum :estado, { pendente: 0, confirmada: 1, cancelada: 2, finalizada: 3 }

  validates :pedido, :estado, :time, presence: true
end
