class AddFormaPagoToBoletas < ActiveRecord::Migration[7.0]
  def change
     add_column :boletas, :forma_pago, :integer, default: 0
  end
end
