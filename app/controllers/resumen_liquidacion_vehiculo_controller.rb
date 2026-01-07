class ResumenLiquidacionVehiculoController < ApplicationController
  def index
    matricula = params[:matricula]
    mes = params[:mes]
    anio = params[:anio]
    
    @total_recaudado = params[:final_recaudacion].to_f
    @combustible = params[:final_combustible].to_f
    @salario = params[:final_comision].to_f
    @aceite = params[:final_aceite].to_f
    @gomeria = params[:final_gomeria].to_f
    @lavados = params[:final_lavados].to_f
    @otros = params[:final_otros].to_f
    @aportes = params[:final_aportes].to_f   
    @dias_recaudados = params[:dias_recaudados].to_f
    @total_kmts = params[:final_kmts].to_f
    @ganancia = params[:final_ganancia].to_f

    if @dias_recaudados > 0
      @promedio_diario = @total_recaudado / @dias_recaudados
    end

    if @total_kmts > 0     
      @promedio_kmt_mensual = @total_recaudado / @total_kmts
    end

    @titulo_periodo = sprintf("%s, periodo %s/%s", matricula, mes, anio)


## calculo incidencias   
    @incidencia_combustible = (@combustible / @total_recaudado) * 100
    @incidencia_aceite = (@aceite / @total_recaudado) * 100
    @incidencia_gomeria = (@gomeria / @total_recaudado) * 100
    @incidencia_lavados = (@lavados / @total_recaudado) * 100
    @incidencia_otros = (@otros / @total_recaudado) * 100
    @incidencia_salario = (@salario / @total_recaudado) * 100
    @incidencia_aportes = (@aportes / @total_recaudado) * 100
    @incidencia_ganancia = (@ganancia / @total_recaudado) * 100      
  end
end
