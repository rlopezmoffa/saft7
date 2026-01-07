class LineaLiquidacionVehiculo
attr_accessor :mes, :anio, :dia, :rec_diurna, :rec_nocturna, :comision, :combustible, :aceite, 
    :gomeria, :lavados, :otros, :detalle_otros, :aportes, :subtotal, :ganancia, :kmts, :valor_kmt, 
    :adic_ingresos, :adic_egresos
	
extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end  

  def recaudacion
    self.rec_diurna.to_f + self.rec_nocturna.to_f
  end
end