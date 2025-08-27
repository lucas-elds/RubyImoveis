json.extract! solicitacao, :id, :mensagem, :data_visita_proposta, :preco_proposto, :status, :created_at, :updated_at
json.url solicitacao_url(solicitacao, format: :json)
