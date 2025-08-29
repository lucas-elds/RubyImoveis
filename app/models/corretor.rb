class Corretor < ApplicationRecord
  # Autenticação
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Relacionamentos
  has_many :imoveis, dependent: :destroy
  has_many :vendas, dependent: :destroy
  has_many :solicitacoes, through: :imoveis

  # Validações
  validates :nome, presence: true
  validates :cpf, presence: true, uniqueness: true
  validates :creci, presence: true, uniqueness: { case_sensitive: false }
  validates :telefone, presence: true
end
