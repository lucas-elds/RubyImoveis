require 'rails_helper'

RSpec.describe Solicitacao, type: :model do
  # Cria uma solicitação válida existente para testes de unicidade
  subject { create(:solicitacao) }

  # Validações de presença
  it { should validate_presence_of(:status) }

  # Validação de inclusão
  it { should validate_inclusion_of(:status).in_array(Solicitacao::STATUS_SOLICITACAO) }

  # Validação de unicidade composta
  it do
    should validate_uniqueness_of(:cliente_id)
      .scoped_to(:imovel_id)
      .with_message("já registrou interesse neste imóvel")
  end

  # Associações
  it { should belong_to(:imovel) }
  it { should belong_to(:cliente) }
  it { should have_one(:corretor).through(:imovel) }
end
