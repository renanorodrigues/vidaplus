class ProfissionalUnidadeMedica < ApplicationRecord
  belongs_to :profissional
  belongs_to :unidade_medica
  has_paper_trail
end
