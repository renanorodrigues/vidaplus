class Usuario < ApplicationRecord
  has_secure_password
  validates :email, format: {with: URI::MailTo::EMAIL_REGEXP}, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }
  enum :estado, { ativo: 0, desativado:1 }

  before_save :downcase_email

  private

  def downcase_email
    self.email = email.downcase
  end
end
