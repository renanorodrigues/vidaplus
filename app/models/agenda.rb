class Agenda < ApplicationRecord
  belongs_to :profissional
  belongs_to :unidade_medica
  has_paper_trail

  validates :data_inicio, :data_termino, :horarios, presence: true
  enum :estado, { desativado: 0, ativado: 1, pendente: 2 }
end
