class RemoveAportesFromBoletas < ActiveRecord::Migration[7.0]
  def change
    remove_column :boletas, :aportes, :decimal
  end
end
