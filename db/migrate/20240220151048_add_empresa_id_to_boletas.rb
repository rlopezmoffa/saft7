class AddEmpresaIdToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :empresa_id, :integer, default: 0
  end
end
