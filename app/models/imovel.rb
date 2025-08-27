class Imovel < ApplicationRecord
  belongs_to :corretor
  has_many :solicitacoes, dependent: :destroy
  has_many :clientes, through: :solicitacoes

  STATUSES = ["disponível", "vendido"]

  validates :status, inclusion: { in: STATUSES }

  # Validações
  validates :preco, presence: true, numericality: { greater_than: 0 }
  validates :tamanho, presence: true
  validates :n_quartos, :n_banheiros, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :rua, :numero, :cidade, :bairro, :uf, presence: true
end
