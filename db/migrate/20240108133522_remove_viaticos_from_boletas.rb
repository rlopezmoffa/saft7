class RemoveViaticosFromBoletas < ActiveRecord::Migration[7.0]
  def change
    remove_column :boletas, :viaticos, :decimal
  end
end
