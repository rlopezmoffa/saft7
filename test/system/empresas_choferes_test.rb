require "application_system_test_case"

class EmpresaChoferesTest < ApplicationSystemTestCase
  setup do
    @empresa_chofer = empresas_choferes(:one)
  end

  test "visiting the index" do
    visit empresas_choferes_url
    assert_selector "h1", text: "Empresa choferes"
  end

  test "should create empresa chofer" do
    visit empresas_choferes_url
    click_on "New empresa chofer"

    fill_in "Chofer", with: @empresa_chofer.chofer_id
    fill_in "Empresa", with: @empresa_chofer.empresa_id
    fill_in "Fecha alta", with: @empresa_chofer.fecha_alta
    click_on "Create Empresa chofer"

    assert_text "Empresa chofer was successfully created"
    click_on "Back"
  end

  test "should update Empresa chofer" do
    visit empresa_chofer_url(@empresa_chofer)
    click_on "Edit this empresa chofer", match: :first

    fill_in "Chofer", with: @empresa_chofer.chofer_id
    fill_in "Empresa", with: @empresa_chofer.empresa_id
    fill_in "Fecha alta", with: @empresa_chofer.fecha_alta
    click_on "Update Empresa chofer"

    assert_text "Empresa chofer was successfully updated"
    click_on "Back"
  end

  test "should destroy Empresa chofer" do
    visit empresa_chofer_url(@empresa_chofer)
    click_on "Destroy this empresa chofer", match: :first

    assert_text "Empresa chofer was successfully destroyed"
  end
end
