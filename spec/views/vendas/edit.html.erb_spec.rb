require 'rails_helper'

RSpec.describe "vendas/edit", type: :view do
  let(:venda) {
    Venda.create!(
      valor: "9.99",
      corretor: nil,
      cliente: nil,
      imovel: nil
    )
  }

  before(:each) do
    assign(:venda, venda)
  end

  it "renders the edit venda form" do
    render

    assert_select "form[action=?][method=?]", venda_path(venda), "post" do

      assert_select "input[name=?]", "venda[valor]"

      assert_select "input[name=?]", "venda[corretor_id]"

      assert_select "input[name=?]", "venda[cliente_id]"

      assert_select "input[name=?]", "venda[imovel_id]"
    end
  end
end
