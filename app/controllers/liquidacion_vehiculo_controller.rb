class LiquidacionVehiculoController < ApplicationController
  def index
    @lineas_reporte = Array.new
    if params[:vehiculo]
      @vehiculo = Vehiculo.find(params[:vehiculo][:id].to_i)
      @mes = params[:mes]
      @anio = params[:anio]

      for dia in 1..31 do     
        linea = LineaLiquidacionVehiculo.new
        linea.dia = dia  
        linea.comision = 0
        linea.combustible = 0
        linea.aceite = 0
        linea.gomeria = 0
        linea.lavados = 0
        linea.otros = 0
        linea.detalle_otros = ""
        linea.aportes = 0
        linea.kmts = 0
        linea.subtotal = 0
        linea.ganancia = 0
        linea.valor_kmt = 0          
        linea.rec_diurna = 0
        linea.rec_nocturna = 0      
        @lineas_reporte << linea
      end

      @final_diurno = @final_nocturno = 0
      @final_comision = 0
      @final_combustible = 0
      @final_aceite = 0
      @final_gomeria = 0
      @final_lavados = 0
      @final_otros = 0
      @final_aportes = 0
      @final_kmts = 0
   
      @boletas = Boleta.where('vehiculo_id = ?', @vehiculo.id).where('extract(year from fecha) = ?', @anio).
        where('extract(month from fecha) = ?', @mes)  

      @boletas.each do | boleta |
        acumula(boleta)
      end    

      @lineas_reporte.each do | x |
        @final_diurno += x.rec_diurna
        @final_nocturno += x.rec_nocturna
        @final_comision += x.comision
        @final_combustible += x.combustible
        @final_aceite += x.aceite
        @final_gomeria += x.gomeria
        @final_lavados += x.lavados
        @final_otros += x.otros
        @final_aportes += x.aportes
        @final_kmts += x.kmts
      end
      @final_recaudacion = @final_diurno + @final_nocturno
    end # if params
  end 

  def acumula(boleta)    
   
    @lineas_reporte.each do | linea |      
      if linea.dia == boleta.fecha.day        
        linea.comision += boleta.comision
        linea.combustible += boleta.combustible
        linea.aceite += boleta.aceite
        linea.gomeria += boleta.gomeria
        linea.lavados += boleta.lavados
        linea.otros += boleta.otros
        linea.detalle_otros = boleta.detalle_otros
        linea.aportes += boleta.get_total_aportes
        linea.kmts += boleta.get_kmts_recorridos
        linea.subtotal = 0
        linea.ganancia = 0
        linea.valor_kmt = 0
        if boleta.turno == 1    
          linea.rec_diurna += boleta.total_recaudado
        else
          linea.rec_nocturna += boleta.total_recaudado
        end # turno     
      end # if dia 
    end # each       
  end  # acumula
end # class
