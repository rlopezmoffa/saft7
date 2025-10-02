require "test_helper"

class VencimientosDocumentacionChoferesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get vencimientos_documentacion_choferes_index_url
    assert_response :success
  end
end
