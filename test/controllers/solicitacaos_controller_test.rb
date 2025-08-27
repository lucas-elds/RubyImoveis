require "test_helper"

class SolicitacaosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @solicitacao = solicitacaos(:one)
  end

  test "should get index" do
    get solicitacaos_url
    assert_response :success
  end

  test "should get new" do
    get new_solicitacao_url
    assert_response :success
  end

  test "should create solicitacao" do
    assert_difference("Solicitacao.count") do
      post solicitacaos_url, params: { solicitacao: { data_visita_proposta: @solicitacao.data_visita_proposta, mensagem: @solicitacao.mensagem, preco_proposto: @solicitacao.preco_proposto, status: @solicitacao.status } }
    end

    assert_redirected_to solicitacao_url(Solicitacao.last)
  end

  test "should show solicitacao" do
    get solicitacao_url(@solicitacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_solicitacao_url(@solicitacao)
    assert_response :success
  end

  test "should update solicitacao" do
    patch solicitacao_url(@solicitacao), params: { solicitacao: { data_visita_proposta: @solicitacao.data_visita_proposta, mensagem: @solicitacao.mensagem, preco_proposto: @solicitacao.preco_proposto, status: @solicitacao.status } }
    assert_redirected_to solicitacao_url(@solicitacao)
  end

  test "should destroy solicitacao" do
    assert_difference("Solicitacao.count", -1) do
      delete solicitacao_url(@solicitacao)
    end

    assert_redirected_to solicitacaos_url
  end
end
