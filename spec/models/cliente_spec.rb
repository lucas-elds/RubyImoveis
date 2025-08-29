require 'rails_helper'

RSpec.describe Cliente, type: :model do
  # Cria um cliente válido existente para testes de unicidade
  subject { create(:cliente) }

  # Validações de presença
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:cpf) }
  it { should validate_presence_of(:telefone) }

  # Validações de unicidade
  it { should validate_uniqueness_of(:cpf).case_insensitive }

  # Associações
  it { should have_many(:solicitacoes).dependent(:destroy) }
  it { should have_many(:vendas).dependent(:destroy) }
  it { should have_many(:imoveis).through(:solicitacoes) }
end
