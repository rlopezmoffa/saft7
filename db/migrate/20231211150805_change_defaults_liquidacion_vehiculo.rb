class ChangeDefaultsLiquidacionVehiculo < ActiveRecord::Migration[7.0]
  def change    
    change_column_default :liquidaciones_vehiculos, :rec_diurna, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :rec_nocturna, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :comision, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :combustible, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :aceite, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :gomeria, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :lavados, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :otros, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :aportes, from: nil, to: 0  
    change_column_default :liquidaciones_vehiculos, :kmts, from: nil, to: 0  
  end
end
