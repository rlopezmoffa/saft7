require "test_helper"

class ChoferesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chofer = choferes(:one)
  end

  test "should get index" do
    get choferes_url
    assert_response :success
  end

  test "should get new" do
    get new_chofer_url
    assert_response :success
  end

  test "should create chofer" do
    assert_difference("Chofer.count") do
      post choferes_url, params: { chofer: { apellido: @chofer.apellido, codigo: @chofer.codigo, nombre: @chofer.nombre } }
    end

    assert_redirected_to chofer_url(Chofer.last)
  end

  test "should show chofer" do
    get chofer_url(@chofer)
    assert_response :success
  end

  test "should get edit" do
    get edit_chofer_url(@chofer)
    assert_response :success
  end

  test "should update chofer" do
    patch chofer_url(@chofer), params: { chofer: { apellido: @chofer.apellido, codigo: @chofer.codigo, nombre: @chofer.nombre } }
    assert_redirected_to chofer_url(@chofer)
  end

  test "should destroy chofer" do
    assert_difference("Chofer.count", -1) do
      delete chofer_url(@chofer)
    end

    assert_redirected_to choferes_url
  end
end
