require "test_helper"

class ItemsMantenimientoControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_mantenimiento = items_mantenimiento(:one)
  end

  test "should get index" do
    get items_mantenimiento_url
    assert_response :success
  end

  test "should get new" do
    get new_item_mantenimiento_url
    assert_response :success
  end

  test "should create item_mantenimiento" do
    assert_difference("ItemMantenimiento.count") do
      post items_mantenimiento_url, params: { item_mantenimiento: { cambiar_dias: @item_mantenimiento.cambiar_dias, cambiar_kmts: @item_mantenimiento.cambiar_kmts, nombre: @item_mantenimiento.nombre } }
    end

    assert_redirected_to item_mantenimiento_url(ItemMantenimiento.last)
  end

  test "should show item_mantenimiento" do
    get item_mantenimiento_url(@item_mantenimiento)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_mantenimiento_url(@item_mantenimiento)
    assert_response :success
  end

  test "should update item_mantenimiento" do
    patch item_mantenimiento_url(@item_mantenimiento), params: { item_mantenimiento: { cambiar_dias: @item_mantenimiento.cambiar_dias, cambiar_kmts: @item_mantenimiento.cambiar_kmts, nombre: @item_mantenimiento.nombre } }
    assert_redirected_to item_mantenimiento_url(@item_mantenimiento)
  end

  test "should destroy item_mantenimiento" do
    assert_difference("ItemMantenimiento.count", -1) do
      delete item_mantenimiento_url(@item_mantenimiento)
    end

    assert_redirected_to items_mantenimiento_url
  end
end
