class AddVehiculoIdToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :vehiculo_id, :integer, :default => 0
  end
end
