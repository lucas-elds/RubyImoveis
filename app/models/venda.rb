class Venda < ApplicationRecord
  belongs_to :corretor
  belongs_to :cliente
  belongs_to :imovel
end
