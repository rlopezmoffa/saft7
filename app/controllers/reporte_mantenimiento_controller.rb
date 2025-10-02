class ReporteMantenimientoController < ApplicationController
  def index
    begin
      @fecha_inicial = Time.parse(session[:from]) # set dates from cookie
      @fecha_final = Time.parse(session[:to])
    rescue Exception => e
      @fecha_inicial = Time.now
      @fecha_final = Time.now
    end

    @servicios_realizados = Array.new
    if params[:from]
      @fecha_inicial = @from = Date.civil(params[:from][:year].to_i, params[:from][:month].to_i, params[:from][:day].to_i)
      @fecha_final = @to = Date.civil(params[:to][:year].to_i, params[:to][:month].to_i, params[:to][:day].to_i)
      session[:from]=@from.to_s # store dates in cookie
      session[:to]=@to.to_s      

      vehiculo_id = params[:vehiculo][:id].to_i

      @servicios_realizados = ServicioRealizado.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc').
        where('vehiculo_id = ?', vehiculo_id)             
    end    
  end
end
