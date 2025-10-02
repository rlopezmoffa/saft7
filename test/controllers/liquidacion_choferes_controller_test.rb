require "test_helper"

class LiquidacionChoferesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get liquidacion_choferes_index_url
    assert_response :success
  end
end
