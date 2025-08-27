require "application_system_test_case"

class CorretorsTest < ApplicationSystemTestCase
  setup do
    @corretor = corretors(:one)
  end

  test "visiting the index" do
    visit corretors_url
    assert_selector "h1", text: "Corretors"
  end

  test "should create corretor" do
    visit corretors_url
    click_on "New corretor"

    fill_in "Cpf", with: @corretor.cpf
    fill_in "Creci", with: @corretor.creci
    fill_in "Endereco", with: @corretor.endereco
    fill_in "Nome", with: @corretor.nome
    fill_in "Telefone", with: @corretor.telefone
    click_on "Create Corretor"

    assert_text "Corretor was successfully created"
    click_on "Back"
  end

  test "should update Corretor" do
    visit corretor_url(@corretor)
    click_on "Edit this corretor", match: :first

    fill_in "Cpf", with: @corretor.cpf
    fill_in "Creci", with: @corretor.creci
    fill_in "Endereco", with: @corretor.endereco
    fill_in "Nome", with: @corretor.nome
    fill_in "Telefone", with: @corretor.telefone
    click_on "Update Corretor"

    assert_text "Corretor was successfully updated"
    click_on "Back"
  end

  test "should destroy Corretor" do
    visit corretor_url(@corretor)
    click_on "Destroy this corretor", match: :first

    assert_text "Corretor was successfully destroyed"
  end
end
