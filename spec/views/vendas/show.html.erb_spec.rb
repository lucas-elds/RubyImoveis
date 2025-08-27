require 'rails_helper'

RSpec.describe "vendas/show", type: :view do
  before(:each) do
    assign(:venda, Venda.create!(
      valor: "9.99",
      corretor: nil,
      cliente: nil,
      imovel: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
