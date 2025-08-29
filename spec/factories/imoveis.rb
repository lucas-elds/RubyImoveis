FactoryBot.define do
  factory :imovel do
    corretor
    status { "disponível" }
    tipo { "Apartamento" }
    preco { 250_000 }
    tamanho { 80 }
    n_quartos { 2 }
    n_banheiros { 1 }
    rua { "Rua Exemplo" }
    numero { "123" }
    cidade { "São Paulo" }
    bairro { "Centro" }
    uf { "SP" }
  end
end
