class Solicitacao < ApplicationRecord
  belongs_to :cliente
  belongs_to :imovel

  # Validações
  validates :cliente_id, uniqueness: { scope: :imovel_id, message: "já registrou interesse neste imóvel" }
end
