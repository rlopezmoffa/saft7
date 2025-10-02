class AddTotalRecaudadoToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :total_recaudado, :decimal, default: 0
  end
end
