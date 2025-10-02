class ResumenLiquidacionVehiculoController < ApplicationController
  def index
    @total_recaudado = params[:final_recaudacion]
    @combustible = params[:final_combustible]
    @salario = params[:final_comision]
    @aceite = params[:final_aceite]
    @gomeria = params[:final_gomeria]
    @lavados = params[:final_lavados]
    @otros = params[:final_otros]
    @aportes = params[:final_aportes]    
    @total_kmts = params[:final_kmts]    
  end
end
