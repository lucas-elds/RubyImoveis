require 'rails_helper'

RSpec.describe "vendas/new", type: :view do
  before(:each) do
    assign(:venda, Venda.new(
      valor: "9.99",
      corretor: nil,
      cliente: nil,
      imovel: nil
    ))
  end

  it "renders new venda form" do
    render

    assert_select "form[action=?][method=?]", vendas_path, "post" do

      assert_select "input[name=?]", "venda[valor]"

      assert_select "input[name=?]", "venda[corretor_id]"

      assert_select "input[name=?]", "venda[cliente_id]"

      assert_select "input[name=?]", "venda[imovel_id]"
    end
  end
end
