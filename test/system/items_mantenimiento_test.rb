require "application_system_test_case"

class ItemMantenimientosTest < ApplicationSystemTestCase
  setup do
    @item_mantenimiento = items_mantenimiento(:one)
  end

  test "visiting the index" do
    visit items_mantenimiento_url
    assert_selector "h1", text: "Item mantenimientos"
  end

  test "should create item mantenimiento" do
    visit items_mantenimiento_url
    click_on "New item mantenimiento"

    fill_in "Cambiar dias", with: @item_mantenimiento.cambiar_dias
    fill_in "Cambiar kmts", with: @item_mantenimiento.cambiar_kmts
    fill_in "Nombre", with: @item_mantenimiento.nombre
    click_on "Create Item mantenimiento"

    assert_text "Item mantenimiento was successfully created"
    click_on "Back"
  end

  test "should update Item mantenimiento" do
    visit item_mantenimiento_url(@item_mantenimiento)
    click_on "Edit this item mantenimiento", match: :first

    fill_in "Cambiar dias", with: @item_mantenimiento.cambiar_dias
    fill_in "Cambiar kmts", with: @item_mantenimiento.cambiar_kmts
    fill_in "Nombre", with: @item_mantenimiento.nombre
    click_on "Update Item mantenimiento"

    assert_text "Item mantenimiento was successfully updated"
    click_on "Back"
  end

  test "should destroy Item mantenimiento" do
    visit item_mantenimiento_url(@item_mantenimiento)
    click_on "Destroy this item mantenimiento", match: :first

    assert_text "Item mantenimiento was successfully destroyed"
  end
end
