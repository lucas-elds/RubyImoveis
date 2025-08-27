require 'rails_helper'

RSpec.describe "vendas/index", type: :view do
  before(:each) do
    assign(:vendas, [
      Venda.create!(
        valor: "9.99",
        corretor: nil,
        cliente: nil,
        imovel: nil
      ),
      Venda.create!(
        valor: "9.99",
        corretor: nil,
        cliente: nil,
        imovel: nil
      )
    ])
  end

  it "renders a list of vendas" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("9.99".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
