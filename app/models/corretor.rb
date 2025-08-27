class Corretor < ApplicationRecord
  # Autenticação
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relacionamentos
  has_many :imoveis, dependent: :destroy

  # Validações
  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :creci, presence: true, uniqueness: true
  validates :telefone, presence: true
end
