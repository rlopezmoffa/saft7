class AddAporteManualToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :aporte_manual, :decimal, :precision => 10, :scale => 3, default: 0
  end
end
