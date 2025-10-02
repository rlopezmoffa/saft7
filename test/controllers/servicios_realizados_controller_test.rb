require "test_helper"

class ServiciosRealizadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @servicio_realizado = servicios_realizados(:one)
  end

  test "should get index" do
    get servicios_realizados_url
    assert_response :success
  end

  test "should get new" do
    get new_servicio_realizado_url
    assert_response :success
  end

  test "should create servicio_realizado" do
    assert_difference("ServicioRealizado.count") do
      post servicios_realizados_url, params: { servicio_realizado: { fecha: @servicio_realizado.fecha, fecha_proximo: @servicio_realizado.fecha_proximo, item: @servicio_realizado.item, kmts: @servicio_realizado.kmts, kmts_proximo: @servicio_realizado.kmts_proximo, observaciones: @servicio_realizado.observaciones } }
    end

    assert_redirected_to servicio_realizado_url(ServicioRealizado.last)
  end

  test "should show servicio_realizado" do
    get servicio_realizado_url(@servicio_realizado)
    assert_response :success
  end

  test "should get edit" do
    get edit_servicio_realizado_url(@servicio_realizado)
    assert_response :success
  end

  test "should update servicio_realizado" do
    patch servicio_realizado_url(@servicio_realizado), params: { servicio_realizado: { fecha: @servicio_realizado.fecha, fecha_proximo: @servicio_realizado.fecha_proximo, item: @servicio_realizado.item, kmts: @servicio_realizado.kmts, kmts_proximo: @servicio_realizado.kmts_proximo, observaciones: @servicio_realizado.observaciones } }
    assert_redirected_to servicio_realizado_url(@servicio_realizado)
  end

  test "should destroy servicio_realizado" do
    assert_difference("ServicioRealizado.count", -1) do
      delete servicio_realizado_url(@servicio_realizado)
    end

    assert_redirected_to servicios_realizados_url
  end
end
