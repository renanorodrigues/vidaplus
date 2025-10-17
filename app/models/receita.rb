class Receita < ApplicationRecord
  belongs_to :profissional
  belongs_to :paciente
  has_paper_trail

  validates :prescricao, :observacao, presence: true
end
