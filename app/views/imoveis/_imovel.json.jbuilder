json.extract! imovel, :id, :preco, :tamanho, :n_quartos, :n_banheiros, :rua, :numero, :cidade, :bairro, :uf, :corretor_id, :created_at, :updated_at
json.url imovel_url(imovel, format: :json)
