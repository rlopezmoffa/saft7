class ChangeDefaultsBoletas < ActiveRecord::Migration[7.0]
  def change
    change_column_default :boletas, :recaudacion, from: nil, to: 0        
    change_column_default :boletas, :comision, from: nil, to: 0  
    change_column_default :boletas, :combustible, from: nil, to: 0  
    change_column_default :boletas, :aceite, from: nil, to: 0  
    change_column_default :boletas, :gomeria, from: nil, to: 0  
    change_column_default :boletas, :lavados, from: nil, to: 0  
    change_column_default :boletas, :otros, from: nil, to: 0      
    change_column_default :boletas, :aportes, from: nil, to: 0  
    change_column_default :boletas, :kmts, from: nil, to: 0         
  end
end
