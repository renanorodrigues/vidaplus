class Administrador < ApplicationRecord
  belongs_to :usuario

  validates :nome_completo, :contato, presence: true
end
