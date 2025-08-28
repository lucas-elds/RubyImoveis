class Solicitacao < ApplicationRecord
  belongs_to :imovel
  belongs_to :cliente
  has_one :corretor, through: :imovel

  STATUS_SOLICITACAO = ["Em Aberto", "Aceita", "Rejeitada", "Concluída"]
  validates :status, presence: true, inclusion: { in: STATUS_SOLICITACAO }

  # Validações
  validates :cliente_id, uniqueness: { scope: :imovel_id, message: "já registrou interesse neste imóvel" }
end
