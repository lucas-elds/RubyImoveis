require 'rails_helper'

RSpec.describe Corretor, type: :model do
  subject { create(:corretor) }

  # Validações de presença
  it { should validate_presence_of(:nome) }
  it { should validate_presence_of(:cpf) }
  it { should validate_uniqueness_of(:cpf).case_insensitive }
  it { should validate_presence_of(:creci) }   # apenas presença, sem unicidade
  it { should validate_presence_of(:telefone) }

  # Associações
  it { should have_many(:imoveis).dependent(:destroy) }
  it { should have_many(:vendas).dependent(:destroy) }
  it { should have_many(:solicitacoes).through(:imoveis) }
end
