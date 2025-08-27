require "application_system_test_case"

class ImovelsTest < ApplicationSystemTestCase
  setup do
    @imovel = imovels(:one)
  end

  test "visiting the index" do
    visit imovels_url
    assert_selector "h1", text: "Imovels"
  end

  test "should create imovel" do
    visit imovels_url
    click_on "New imovel"

    fill_in "Bairro", with: @imovel.bairro
    fill_in "Cidade", with: @imovel.cidade
    fill_in "Corretor", with: @imovel.corretor_id
    fill_in "N banheiros", with: @imovel.n_banheiros
    fill_in "N quartos", with: @imovel.n_quartos
    fill_in "Numero", with: @imovel.numero
    fill_in "Preco", with: @imovel.preco
    fill_in "Rua", with: @imovel.rua
    fill_in "Tamanho", with: @imovel.tamanho
    fill_in "Uf", with: @imovel.uf
    click_on "Create Imovel"

    assert_text "Imovel was successfully created"
    click_on "Back"
  end

  test "should update Imovel" do
    visit imovel_url(@imovel)
    click_on "Edit this imovel", match: :first

    fill_in "Bairro", with: @imovel.bairro
    fill_in "Cidade", with: @imovel.cidade
    fill_in "Corretor", with: @imovel.corretor_id
    fill_in "N banheiros", with: @imovel.n_banheiros
    fill_in "N quartos", with: @imovel.n_quartos
    fill_in "Numero", with: @imovel.numero
    fill_in "Preco", with: @imovel.preco
    fill_in "Rua", with: @imovel.rua
    fill_in "Tamanho", with: @imovel.tamanho
    fill_in "Uf", with: @imovel.uf
    click_on "Update Imovel"

    assert_text "Imovel was successfully updated"
    click_on "Back"
  end

  test "should destroy Imovel" do
    visit imovel_url(@imovel)
    click_on "Destroy this imovel", match: :first

    assert_text "Imovel was successfully destroyed"
  end
end
