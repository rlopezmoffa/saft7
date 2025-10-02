require "test_helper"

class AdministracionesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @administracion = administraciones(:one)
  end

  test "should get index" do
    get administraciones_url
    assert_response :success
  end

  test "should get new" do
    get new_administracion_url
    assert_response :success
  end

  test "should create administracion" do
    assert_difference("Administracion.count") do
      post administraciones_url, params: { administracion: { nombre: @administracion.nombre } }
    end

    assert_redirected_to administracion_url(Administracion.last)
  end

  test "should show administracion" do
    get administracion_url(@administracion)
    assert_response :success
  end

  test "should get edit" do
    get edit_administracion_url(@administracion)
    assert_response :success
  end

  test "should update administracion" do
    patch administracion_url(@administracion), params: { administracion: { nombre: @administracion.nombre } }
    assert_redirected_to administracion_url(@administracion)
  end

  test "should destroy administracion" do
    assert_difference("Administracion.count", -1) do
      delete administracion_url(@administracion)
    end

    assert_redirected_to administraciones_url
  end
end
