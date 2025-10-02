class AddCombustibleCreditoToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :combustible_credito, :decimal, :precision => 10, :scale => 3, default: 0
  end
end
