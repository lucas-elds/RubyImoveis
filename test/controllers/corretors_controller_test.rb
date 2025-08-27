require "test_helper"

class CorretorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @corretor = corretors(:one)
  end

  test "should get index" do
    get corretors_url
    assert_response :success
  end

  test "should get new" do
    get new_corretor_url
    assert_response :success
  end

  test "should create corretor" do
    assert_difference("Corretor.count") do
      post corretors_url, params: { corretor: { cpf: @corretor.cpf, creci: @corretor.creci, endereco: @corretor.endereco, nome: @corretor.nome, telefone: @corretor.telefone } }
    end

    assert_redirected_to corretor_url(Corretor.last)
  end

  test "should show corretor" do
    get corretor_url(@corretor)
    assert_response :success
  end

  test "should get edit" do
    get edit_corretor_url(@corretor)
    assert_response :success
  end

  test "should update corretor" do
    patch corretor_url(@corretor), params: { corretor: { cpf: @corretor.cpf, creci: @corretor.creci, endereco: @corretor.endereco, nome: @corretor.nome, telefone: @corretor.telefone } }
    assert_redirected_to corretor_url(@corretor)
  end

  test "should destroy corretor" do
    assert_difference("Corretor.count", -1) do
      delete corretor_url(@corretor)
    end

    assert_redirected_to corretors_url
  end
end
