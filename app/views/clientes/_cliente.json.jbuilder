json.extract! cliente, :id, :nome, :cpf, :endereco, :telefone, :created_at, :updated_at
json.url cliente_url(cliente, format: :json)
