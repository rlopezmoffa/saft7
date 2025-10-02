class RemoveViaticoFromBoletas < ActiveRecord::Migration[7.0]
  def change
    remove_column :boletas, :viatico, :decimal
  end
end
