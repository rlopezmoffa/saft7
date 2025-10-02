require "application_system_test_case"

class ServicioRealizadosTest < ApplicationSystemTestCase
  setup do
    @servicio_realizado = servicios_realizados(:one)
  end

  test "visiting the index" do
    visit servicios_realizados_url
    assert_selector "h1", text: "Servicio realizados"
  end

  test "should create servicio realizado" do
    visit servicios_realizados_url
    click_on "New servicio realizado"

    fill_in "Fecha", with: @servicio_realizado.fecha
    fill_in "Fecha proximo", with: @servicio_realizado.fecha_proximo
    fill_in "Item", with: @servicio_realizado.item
    fill_in "Kmts", with: @servicio_realizado.kmts
    fill_in "Kmts proximo", with: @servicio_realizado.kmts_proximo
    fill_in "Observaciones", with: @servicio_realizado.observaciones
    click_on "Create Servicio realizado"

    assert_text "Servicio realizado was successfully created"
    click_on "Back"
  end

  test "should update Servicio realizado" do
    visit servicio_realizado_url(@servicio_realizado)
    click_on "Edit this servicio realizado", match: :first

    fill_in "Fecha", with: @servicio_realizado.fecha
    fill_in "Fecha proximo", with: @servicio_realizado.fecha_proximo
    fill_in "Item", with: @servicio_realizado.item
    fill_in "Kmts", with: @servicio_realizado.kmts
    fill_in "Kmts proximo", with: @servicio_realizado.kmts_proximo
    fill_in "Observaciones", with: @servicio_realizado.observaciones
    click_on "Update Servicio realizado"

    assert_text "Servicio realizado was successfully updated"
    click_on "Back"
  end

  test "should destroy Servicio realizado" do
    visit servicio_realizado_url(@servicio_realizado)
    click_on "Destroy this servicio realizado", match: :first

    assert_text "Servicio realizado was successfully destroyed"
  end
end
