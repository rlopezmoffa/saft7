class AddAporteCalculadoToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :aporte_calculado, :decimal, :precision => 10, :scale => 3, default: 0
    add_column :boletas, :retenciones, :decimal, :precision => 10, :scale => 3, default: 0
  end
end
