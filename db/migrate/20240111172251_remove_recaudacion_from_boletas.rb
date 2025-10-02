class RemoveRecaudacionFromBoletas < ActiveRecord::Migration[7.0]
  def change
    remove_column :boletas, :recaudacion, :decimal
    remove_column :boletas, :rec_efectivo, :decimal
  end
end
