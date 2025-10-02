class AddChoferIdToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :chofer_id, :integer, :default => 0
  end
end
