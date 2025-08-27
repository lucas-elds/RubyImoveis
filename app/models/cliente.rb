class Cliente < ApplicationRecord
  # Autenticação
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relacionamentos
  has_many :solicitacoes, dependent: :destroy
  has_many :imoveis, through: :solicitacoes

  # Validações
  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :telefone, presence: true
end
