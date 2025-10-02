require "application_system_test_case"

class BoletasTest < ApplicationSystemTestCase
  setup do
    @boleta = boletas(:one)
  end

  test "visiting the index" do
    visit boletas_url
    assert_selector "h1", text: "Boletas"
  end

  test "should create boleta" do
    visit boletas_url
    click_on "New boleta"

    fill_in "Fecha", with: @boleta.fecha
    click_on "Create Boleta"

    assert_text "Boleta was successfully created"
    click_on "Back"
  end

  test "should update Boleta" do
    visit boleta_url(@boleta)
    click_on "Edit this boleta", match: :first

    fill_in "Fecha", with: @boleta.fecha
    click_on "Update Boleta"

    assert_text "Boleta was successfully updated"
    click_on "Back"
  end

  test "should destroy Boleta" do
    visit boleta_url(@boleta)
    click_on "Destroy this boleta", match: :first

    assert_text "Boleta was successfully destroyed"
  end
end
