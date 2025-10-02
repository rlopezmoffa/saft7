require "application_system_test_case"

class AdicionalChoferesTest < ApplicationSystemTestCase
  setup do
    @adicional_chofer = adicionales_choferes(:one)
  end

  test "visiting the index" do
    visit adicionales_choferes_url
    assert_selector "h1", text: "Adicional choferes"
  end

  test "should create adicional chofer" do
    visit adicionales_choferes_url
    click_on "New adicional chofer"

    fill_in "Chofer", with: @adicional_chofer.chofer_id
    fill_in "Fecha", with: @adicional_chofer.fecha
    fill_in "Gastos", with: @adicional_chofer.gastos
    fill_in "Ingresos", with: @adicional_chofer.ingresos
    click_on "Create Adicional chofer"

    assert_text "Adicional chofer was successfully created"
    click_on "Back"
  end

  test "should update Adicional chofer" do
    visit adicional_chofer_url(@adicional_chofer)
    click_on "Edit this adicional chofer", match: :first

    fill_in "Chofer", with: @adicional_chofer.chofer_id
    fill_in "Fecha", with: @adicional_chofer.fecha
    fill_in "Gastos", with: @adicional_chofer.gastos
    fill_in "Ingresos", with: @adicional_chofer.ingresos
    click_on "Update Adicional chofer"

    assert_text "Adicional chofer was successfully updated"
    click_on "Back"
  end

  test "should destroy Adicional chofer" do
    visit adicional_chofer_url(@adicional_chofer)
    click_on "Destroy this adicional chofer", match: :first

    assert_text "Adicional chofer was successfully destroyed"
  end
end
