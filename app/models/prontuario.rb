class Prontuario < ApplicationRecord
  belongs_to :paciente

  validates :historico_clinico, :observacao, presence: true
end
