class LineaLiquidacionVehiculo
attr_accessor :mes, :anio, :dia, :rec_diurna, :rec_nocturna, :comision, :combustible, :aceite, 
    :gomeria, :lavados, :otros, :detalle_otros, :aportes, :subtotal, :ganancia, :kmts, :valor_kmt
	
extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end  
end