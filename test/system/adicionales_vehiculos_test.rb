require "application_system_test_case"

class AdicionalVehiculosTest < ApplicationSystemTestCase
  setup do
    @adicional_vehiculo = adicionales_vehiculos(:one)
  end

  test "visiting the index" do
    visit adicionales_vehiculos_url
    assert_selector "h1", text: "Adicional vehiculos"
  end

  test "should create adicional vehiculo" do
    visit adicionales_vehiculos_url
    click_on "New adicional vehiculo"

    fill_in "Fecha", with: @adicional_vehiculo.fecha
    fill_in "Gastos", with: @adicional_vehiculo.gastos
    fill_in "Ingresos", with: @adicional_vehiculo.ingresos
    fill_in "Vehiculo", with: @adicional_vehiculo.vehiculo_id
    click_on "Create Adicional vehiculo"

    assert_text "Adicional vehiculo was successfully created"
    click_on "Back"
  end

  test "should update Adicional vehiculo" do
    visit adicional_vehiculo_url(@adicional_vehiculo)
    click_on "Edit this adicional vehiculo", match: :first

    fill_in "Fecha", with: @adicional_vehiculo.fecha
    fill_in "Gastos", with: @adicional_vehiculo.gastos
    fill_in "Ingresos", with: @adicional_vehiculo.ingresos
    fill_in "Vehiculo", with: @adicional_vehiculo.vehiculo_id
    click_on "Update Adicional vehiculo"

    assert_text "Adicional vehiculo was successfully updated"
    click_on "Back"
  end

  test "should destroy Adicional vehiculo" do
    visit adicional_vehiculo_url(@adicional_vehiculo)
    click_on "Destroy this adicional vehiculo", match: :first

    assert_text "Adicional vehiculo was successfully destroyed"
  end
end
