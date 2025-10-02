class AddRecaudacionesToBoletas < ActiveRecord::Migration[7.0]
  def change
    change_column_default :boletas, :recaudacion, from: nil, to: 0  
    add_column :boletas, :rec_efectivo, :decimal, default: 0
    add_column :boletas, :rec_mercado_pago, :decimal, default: 0
    add_column :boletas, :rec_oca_cel, :decimal, default: 0
    add_column :boletas, :rec_bits, :decimal, default: 0
    add_column :boletas, :rec_transferencia, :decimal, default: 0
    add_column :boletas, :rec_h13, :decimal, default: 0
    add_column :boletas, :rec_otros, :decimal, default: 0    
  end
end
