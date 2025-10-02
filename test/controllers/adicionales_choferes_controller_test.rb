require "test_helper"

class AdicionalesChoferesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adicional_chofer = adicionales_choferes(:one)
  end

  test "should get index" do
    get adicionales_choferes_url
    assert_response :success
  end

  test "should get new" do
    get new_adicional_chofer_url
    assert_response :success
  end

  test "should create adicional_chofer" do
    assert_difference("AdicionalChofer.count") do
      post adicionales_choferes_url, params: { adicional_chofer: { chofer_id: @adicional_chofer.chofer_id, fecha: @adicional_chofer.fecha, gastos: @adicional_chofer.gastos, ingresos: @adicional_chofer.ingresos } }
    end

    assert_redirected_to adicional_chofer_url(AdicionalChofer.last)
  end

  test "should show adicional_chofer" do
    get adicional_chofer_url(@adicional_chofer)
    assert_response :success
  end

  test "should get edit" do
    get edit_adicional_chofer_url(@adicional_chofer)
    assert_response :success
  end

  test "should update adicional_chofer" do
    patch adicional_chofer_url(@adicional_chofer), params: { adicional_chofer: { chofer_id: @adicional_chofer.chofer_id, fecha: @adicional_chofer.fecha, gastos: @adicional_chofer.gastos, ingresos: @adicional_chofer.ingresos } }
    assert_redirected_to adicional_chofer_url(@adicional_chofer)
  end

  test "should destroy adicional_chofer" do
    assert_difference("AdicionalChofer.count", -1) do
      delete adicional_chofer_url(@adicional_chofer)
    end

    assert_redirected_to adicionales_choferes_url
  end
end
