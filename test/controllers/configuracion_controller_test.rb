require "test_helper"

class ConfiguracionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get configuracion_index_url
    assert_response :success
  end
end
