require "application_system_test_case"

class SolicitacaosTest < ApplicationSystemTestCase
  setup do
    @solicitacao = solicitacaos(:one)
  end

  test "visiting the index" do
    visit solicitacaos_url
    assert_selector "h1", text: "Solicitacaos"
  end

  test "should create solicitacao" do
    visit solicitacaos_url
    click_on "New solicitacao"

    fill_in "Data visita proposta", with: @solicitacao.data_visita_proposta
    fill_in "Mensagem", with: @solicitacao.mensagem
    fill_in "Preco proposto", with: @solicitacao.preco_proposto
    fill_in "Status", with: @solicitacao.status
    click_on "Create Solicitacao"

    assert_text "Solicitacao was successfully created"
    click_on "Back"
  end

  test "should update Solicitacao" do
    visit solicitacao_url(@solicitacao)
    click_on "Edit this solicitacao", match: :first

    fill_in "Data visita proposta", with: @solicitacao.data_visita_proposta
    fill_in "Mensagem", with: @solicitacao.mensagem
    fill_in "Preco proposto", with: @solicitacao.preco_proposto
    fill_in "Status", with: @solicitacao.status
    click_on "Update Solicitacao"

    assert_text "Solicitacao was successfully updated"
    click_on "Back"
  end

  test "should destroy Solicitacao" do
    visit solicitacao_url(@solicitacao)
    click_on "Destroy this solicitacao", match: :first

    assert_text "Solicitacao was successfully destroyed"
  end
end
