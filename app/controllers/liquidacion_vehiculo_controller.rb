class LiquidacionVehiculoController < ApplicationController
  def index
    @lineas_reporte = Array.new
    if params[:vehiculo]
      @vehiculo = Vehiculo.find(params[:vehiculo][:id].to_i)
      @mes = params[:mes]
      @anio = params[:anio]
      @dias_computados = 0
      @matricula = @vehiculo.matricula

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
      @final_subtotal = 0     
      @final_ganancia = 0
   
      @boletas = Boleta.where('vehiculo_id = ?', @vehiculo.id).where('extract(year from fecha) = ?', @anio).
        where('extract(month from fecha) = ?', @mes)  

      @boletas.each do | boleta |
        acumula_boletas(boleta)
      end    

      @adicionales = AdicionalVehiculo.where('vehiculo_id = ?', @vehiculo.id).where('extract(year from fecha) = ?', @anio).
        where('extract(month from fecha) = ?', @mes)  

      @adicionales.each do | adicional |
        acumula_adicionales(adicional)
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
        @final_subtotal += x.subtotal                
      end
    
      @final_recaudacion = @final_diurno + @final_nocturno    

    end # if params
  end 

  def acumula_boletas(boleta)    

    total_valor_kmt = 0
    dias_computados = 0
   
    @lineas_reporte.each do | linea |      
      if linea.dia == boleta.fecha.day        
        linea.comision += boleta.salario.to_f
        linea.combustible += boleta.combustible.to_f
        linea.aceite += boleta.aceite.to_f
        linea.gomeria += boleta.gomeria.to_f
        linea.lavados += boleta.lavados.to_f
        linea.otros += boleta.get_otros
        linea.detalle_otros = boleta.get_detalle_otros(linea)
        linea.aportes += boleta.get_total_aportes
        linea.kmts += boleta.get_kmts_recorridos
        
        linea.subtotal = linea.recaudacion.to_f - linea.comision.to_f - linea.combustible.to_f
        linea.aceite.to_f - linea.gomeria.to_f - linea.lavados.to_f - linea.otros.to_f + linea.aportes.to_f +
        linea.adic_ingresos.to_f - linea.adic_egresos.to_f

        linea.ganancia = 0
        
         if linea.kmts > 0
          linea.valor_kmt = linea.recaudacion / linea.kmts.to_f
          total_valor_kmt += linea.valor_kmt
          dias_computados += 1
        else
          linea.valor_kmt = 0
        end

        if boleta.turno == 1    
          linea.rec_diurna += boleta.total_recaudado
        else
          linea.rec_nocturna += boleta.total_recaudado
        end # turno     
      end # if dia 
    end # each       

    if dias_computados > 0
      @final_valor_kmt = total_valor_kmt / dias_computados
    end
    
    # ganancia
    @dias_recaudados = 0  
    
    for i in 0..@lineas_reporte.count
      if @lineas_reporte[i] != nil
        
        if @lineas_reporte[i].recaudacion != 0
          @dias_recaudados += 1
        end
        
        if(i == 0)
          @lineas_reporte[i].ganancia = @lineas_reporte[i].subtotal
          @final_ganancia += @lineas_reporte[i].ganancia
        else
          @lineas_reporte[i].ganancia = @lineas_reporte[i-1].ganancia + @lineas_reporte[i].subtotal
        end
      end         
    end
  end  # acumula boletas


  def acumula_adicionales(adicional)           
    @lineas_reporte.each do | linea |      
      if linea.dia == adicional.fecha.day                
        linea.otros += adicional.ingresos.to_f
        linea.otros -= adicional.gastos.to_f

        if linea.detalle_otros == ""
          linea.detalle_otros = adicional.concepto
        else
          linea.detalle_otros = sprintf("%s, %s", linea.detalle_otros, adicional.concepto)
        end
      end # if
    end # each
  end # acumula adicionales


end # class
