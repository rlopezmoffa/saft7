class AddTotalEntregadoToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :total_entregado, :decimal, default: 0
  end
end
