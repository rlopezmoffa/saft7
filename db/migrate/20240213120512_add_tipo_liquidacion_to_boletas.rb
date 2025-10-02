class AddTipoLiquidacionToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :tipo_liquidacion, :integer, default: 0
  end
end
