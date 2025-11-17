class ReporteMantenimientoController < ApplicationController
  def index
    begin
      @fecha_inicial = Time.parse(session[:from]) # set dates from cookie
      @fecha_final = Time.parse(session[:to])
    rescue Exception => e
      @fecha_inicial = Time.now
      @fecha_final = Time.now
    end        
    
    @vehiculos = get_vehiculos    
    @items_mantenimiento = get_items_mantenimiento
    @servicios_realizados = Array.new

    if params[:from]
      @fecha_inicial = @from = Date.civil(params[:from][:year].to_i, params[:from][:month].to_i, params[:from][:day].to_i)
      @fecha_final = @to = Date.civil(params[:to][:year].to_i, params[:to][:month].to_i, params[:to][:day].to_i)
      session[:from]=@from.to_s # store dates in cookie
      session[:to]=@to.to_s      
      
      vehiculo_id = params[:vehiculo_id].to_i                
      item_mantenimiento_id = params[:item_mantenimiento_id].to_i
      
      if vehiculo_id == 0
        if item_mantenimiento_id == 0
          @servicios_realizados = ServicioRealizado.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc')
        else
           @servicios_realizados = ServicioRealizado.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc').where('item_id = ?', item_mantenimiento_id)
        end
      else      
        if item_mantenimiento_id == 0
          @servicios_realizados = ServicioRealizado.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc').where('vehiculo_id = ?', vehiculo_id)
        else
           @servicios_realizados = ServicioRealizado.where('fecha >= ? and fecha <= ?', @from, @to).order('fecha desc').
            where('vehiculo_id = ?', vehiculo_id).where('item_id = ?', item_mantenimiento_id)
        end
      end      
     
       @selected_vehiculo_id = vehiculo_id        
       @selected_item_id = item_mantenimiento_id
    end
  end

  def get_vehiculos
    ar_vehiculos = Array.new
    vehiculo = Vehiculo.new
    vehiculo.id = 0
    vehiculo.matricula = "Todos los vehiculos"
    ar_vehiculos.push(vehiculo)
    
    vehiculos = Vehiculo.order(:matricula)
    vehiculos.each do | vehiculo |
      ar_vehiculos.push(vehiculo)
    end

    return ar_vehiculos
  end

  def get_items_mantenimiento
    ar_items_mantenimiento = Array.new
    item_mantenimiento = ItemMantenimiento.new
    item_mantenimiento.id = 0
    item_mantenimiento.nombre = "Todos los items"
    ar_items_mantenimiento.push(item_mantenimiento)
    
    items_mantenimiento = ItemMantenimiento.order(:nombre)
    items_mantenimiento.each do | item_mantenimiento |
      ar_items_mantenimiento.push(item_mantenimiento)
    end

    return ar_items_mantenimiento
  end

end
