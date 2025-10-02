require "test_helper"

class AdicionalesVehiculosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @adicional_vehiculo = adicionales_vehiculos(:one)
  end

  test "should get index" do
    get adicionales_vehiculos_url
    assert_response :success
  end

  test "should get new" do
    get new_adicional_vehiculo_url
    assert_response :success
  end

  test "should create adicional_vehiculo" do
    assert_difference("AdicionalVehiculo.count") do
      post adicionales_vehiculos_url, params: { adicional_vehiculo: { fecha: @adicional_vehiculo.fecha, gastos: @adicional_vehiculo.gastos, ingresos: @adicional_vehiculo.ingresos, vehiculo_id: @adicional_vehiculo.vehiculo_id } }
    end

    assert_redirected_to adicional_vehiculo_url(AdicionalVehiculo.last)
  end

  test "should show adicional_vehiculo" do
    get adicional_vehiculo_url(@adicional_vehiculo)
    assert_response :success
  end

  test "should get edit" do
    get edit_adicional_vehiculo_url(@adicional_vehiculo)
    assert_response :success
  end

  test "should update adicional_vehiculo" do
    patch adicional_vehiculo_url(@adicional_vehiculo), params: { adicional_vehiculo: { fecha: @adicional_vehiculo.fecha, gastos: @adicional_vehiculo.gastos, ingresos: @adicional_vehiculo.ingresos, vehiculo_id: @adicional_vehiculo.vehiculo_id } }
    assert_redirected_to adicional_vehiculo_url(@adicional_vehiculo)
  end

  test "should destroy adicional_vehiculo" do
    assert_difference("AdicionalVehiculo.count", -1) do
      delete adicional_vehiculo_url(@adicional_vehiculo)
    end

    assert_redirected_to adicionales_vehiculos_url
  end
end
