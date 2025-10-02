class LineaLiquidacionChofer
attr_accessor :cedula, :nombre, :jornales, :recaudacion, :salario 	
	
extend ActiveModel::Naming
  include ActiveModel::Conversion
  def persisted?
    false
  end  
end