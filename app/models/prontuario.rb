class Prontuario < ApplicationRecord
  belongs_to :paciente
  has_paper_trail

  validates :historico_clinico, :observacao, presence: true
end
