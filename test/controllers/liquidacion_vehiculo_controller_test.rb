require "test_helper"

class LiquidacionVehiculoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get liquidacion_vehiculo_index_url
    assert_response :success
  end
end
