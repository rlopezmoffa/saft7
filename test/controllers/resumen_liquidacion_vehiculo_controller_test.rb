require "test_helper"

class ResumenLiquidacionVehiculoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resumen_liquidacion_vehiculo_index_url
    assert_response :success
  end
end
