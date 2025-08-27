json.extract! venda, :id, :data, :valor, :corretor_id, :cliente_id, :imovel_id, :created_at, :updated_at
json.url venda_url(venda, format: :json)
