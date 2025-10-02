class AddViaticosToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :viaticos, :decimal, default: 0
  end
end
