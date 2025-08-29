require 'rails_helper'

RSpec.describe Imovel, type: :model do
  subject { create(:imovel) }  # cria um imovel válido existente

  # Validações de presença
  it { should validate_presence_of(:tipo) }
  it { should validate_presence_of(:preco) }
  it { should validate_presence_of(:tamanho) }
  it { should validate_presence_of(:rua) }
  it { should validate_presence_of(:numero) }
  it { should validate_presence_of(:cidade) }
  it { should validate_presence_of(:bairro) }
  it { should validate_presence_of(:uf) }

  # Validações numéricas
  it { should validate_numericality_of(:preco).is_greater_than(0) }
  it { should validate_numericality_of(:n_quartos).only_integer.is_greater_than_or_equal_to(0) }
  it { should validate_numericality_of(:n_banheiros).only_integer.is_greater_than_or_equal_to(0) }

  # Validações de inclusão
  it { should validate_inclusion_of(:status).in_array(Imovel::STATUSES) }
  it { should validate_inclusion_of(:tipo).in_array(Imovel::TIPO_IMOVEIS) }

  # Associações
  it { should belong_to(:corretor) }
  it { should have_many(:solicitacoes).dependent(:destroy) }
  it { should have_many(:clientes).through(:solicitacoes) }
end
