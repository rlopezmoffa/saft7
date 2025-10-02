require "test_helper"

class ReporteMantenimientoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get reporte_mantenimiento_index_url
    assert_response :success
  end
end
