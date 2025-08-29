FactoryBot.define do
  factory :solicitacao do
    imovel
    cliente
    status { "Em Aberto" }
  end
end