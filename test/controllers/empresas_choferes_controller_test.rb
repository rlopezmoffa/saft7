require "test_helper"

class EmpresasChoferesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @empresa_chofer = empresas_choferes(:one)
  end

  test "should get index" do
    get empresas_choferes_url
    assert_response :success
  end

  test "should get new" do
    get new_empresa_chofer_url
    assert_response :success
  end

  test "should create empresa_chofer" do
    assert_difference("EmpresaChofer.count") do
      post empresas_choferes_url, params: { empresa_chofer: { chofer_id: @empresa_chofer.chofer_id, empresa_id: @empresa_chofer.empresa_id, fecha_alta: @empresa_chofer.fecha_alta } }
    end

    assert_redirected_to empresa_chofer_url(EmpresaChofer.last)
  end

  test "should show empresa_chofer" do
    get empresa_chofer_url(@empresa_chofer)
    assert_response :success
  end

  test "should get edit" do
    get edit_empresa_chofer_url(@empresa_chofer)
    assert_response :success
  end

  test "should update empresa_chofer" do
    patch empresa_chofer_url(@empresa_chofer), params: { empresa_chofer: { chofer_id: @empresa_chofer.chofer_id, empresa_id: @empresa_chofer.empresa_id, fecha_alta: @empresa_chofer.fecha_alta } }
    assert_redirected_to empresa_chofer_url(@empresa_chofer)
  end

  test "should destroy empresa_chofer" do
    assert_difference("EmpresaChofer.count", -1) do
      delete empresa_chofer_url(@empresa_chofer)
    end

    assert_redirected_to empresas_choferes_url
  end
end
