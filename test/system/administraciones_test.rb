require "application_system_test_case"

class AdministracionesTest < ApplicationSystemTestCase
  setup do
    @administracion = administraciones(:one)
  end

  test "visiting the index" do
    visit administraciones_url
    assert_selector "h1", text: "Administraciones"
  end

  test "should create administracion" do
    visit administraciones_url
    click_on "New administracion"

    fill_in "Nombre", with: @administracion.nombre
    click_on "Create Administracion"

    assert_text "Administracion was successfully created"
    click_on "Back"
  end

  test "should update Administracion" do
    visit administracion_url(@administracion)
    click_on "Edit this administracion", match: :first

    fill_in "Nombre", with: @administracion.nombre
    click_on "Update Administracion"

    assert_text "Administracion was successfully updated"
    click_on "Back"
  end

  test "should destroy Administracion" do
    visit administracion_url(@administracion)
    click_on "Destroy this administracion", match: :first

    assert_text "Administracion was successfully destroyed"
  end
end
