class Administrador < ApplicationRecord
  belongs_to :usuario
  has_paper_trail

  validates :nome_completo, :contato, presence: true
end
