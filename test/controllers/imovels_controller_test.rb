require "test_helper"

class ImovelsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @imovel = imovels(:one)
  end

  test "should get index" do
    get imovels_url
    assert_response :success
  end

  test "should get new" do
    get new_imovel_url
    assert_response :success
  end

  test "should create imovel" do
    assert_difference("Imovel.count") do
      post imovels_url, params: { imovel: { bairro: @imovel.bairro, cidade: @imovel.cidade, corretor_id: @imovel.corretor_id, n_banheiros: @imovel.n_banheiros, n_quartos: @imovel.n_quartos, numero: @imovel.numero, preco: @imovel.preco, rua: @imovel.rua, tamanho: @imovel.tamanho, uf: @imovel.uf } }
    end

    assert_redirected_to imovel_url(Imovel.last)
  end

  test "should show imovel" do
    get imovel_url(@imovel)
    assert_response :success
  end

  test "should get edit" do
    get edit_imovel_url(@imovel)
    assert_response :success
  end

  test "should update imovel" do
    patch imovel_url(@imovel), params: { imovel: { bairro: @imovel.bairro, cidade: @imovel.cidade, corretor_id: @imovel.corretor_id, n_banheiros: @imovel.n_banheiros, n_quartos: @imovel.n_quartos, numero: @imovel.numero, preco: @imovel.preco, rua: @imovel.rua, tamanho: @imovel.tamanho, uf: @imovel.uf } }
    assert_redirected_to imovel_url(@imovel)
  end

  test "should destroy imovel" do
    assert_difference("Imovel.count", -1) do
      delete imovel_url(@imovel)
    end

    assert_redirected_to imovels_url
  end
end
