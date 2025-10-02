class ChangeTotalEntregado < ActiveRecord::Migration[7.0]
  def change
    change_column_default :boletas, :total_entregado, from: nil, to: 0  
  end
end
