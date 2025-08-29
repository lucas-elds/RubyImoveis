require 'rails_helper'

RSpec.describe Venda, type: :model do
  # Cria uma venda válida
  subject { create(:venda) }

  # Associações
  it { should belong_to(:corretor) }
  it { should belong_to(:cliente) }
  it { should belong_to(:imovel) }
end
