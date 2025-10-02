class RemovePosFromBoletas < ActiveRecord::Migration[7.0]
  def change
    remove_column :boletas, :pos, :decimal
  end
end
