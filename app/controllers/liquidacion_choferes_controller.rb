class LiquidacionChoferesController < ApplicationController
  def index
    @lineas_reporte = Array.new

    if params[:empresa_id]
      @empresa = Empresa.find(params[:empresa_id])
      @mes = params[:mes]
      @anio = params[:anio]   

      
      choferes = Chofer.all
      
      choferes.each do | chofer |
        recaudacion = 0
        salario = 0
        
        boletas_chofer = Boleta.where('empresa_id = ?', @empresa.id).where('extract(year from fecha) = ?', @anio).
            where('extract(month from fecha) = ?', @mes).where('chofer_id = ?', chofer.id)  

       
        if boletas_chofer.count > 0
          boletas_chofer.each do | boleta |
            recaudacion += boleta.total_recaudado
            salario += boleta.get_salario
          end

          linea = LineaLiquidacionChofer.new
          linea.cedula = chofer.cedula
          linea.nombre = chofer.get_nombre_completo
          linea.jornales = boletas_chofer.count
          linea.recaudacion = recaudacion
          linea.salario = salario
          @lineas_reporte << linea
        end
      end  
    end
  end
end
