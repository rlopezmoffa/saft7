require "application_system_test_case"

class ChoferesTest < ApplicationSystemTestCase
  setup do
    @chofer = choferes(:one)
  end

  test "visiting the index" do
    visit choferes_url
    assert_selector "h1", text: "Choferes"
  end

  test "should create chofer" do
    visit choferes_url
    click_on "New chofer"

    fill_in "Apellido", with: @chofer.apellido
    fill_in "Codigo", with: @chofer.codigo
    fill_in "Nombre", with: @chofer.nombre
    click_on "Create Chofer"

    assert_text "Chofer was successfully created"
    click_on "Back"
  end

  test "should update Chofer" do
    visit chofer_url(@chofer)
    click_on "Edit this chofer", match: :first

    fill_in "Apellido", with: @chofer.apellido
    fill_in "Codigo", with: @chofer.codigo
    fill_in "Nombre", with: @chofer.nombre
    click_on "Update Chofer"

    assert_text "Chofer was successfully updated"
    click_on "Back"
  end

  test "should destroy Chofer" do
    visit chofer_url(@chofer)
    click_on "Destroy this chofer", match: :first

    assert_text "Chofer was successfully destroyed"
  end
end
