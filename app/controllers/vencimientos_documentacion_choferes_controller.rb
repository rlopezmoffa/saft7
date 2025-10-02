class VencimientosDocumentacionChoferesController < ApplicationController 
	def index				
		@lineas_reporte = Array.new
		@dias = params[:dias].to_i
		if @dias > 0
		  @documento = params[:documento].to_i
			#choferes = Chofer.where('is_activo = ?', true).order("apellidos ASC")
		  choferes = Chofer.all.order("apellido ASC")
		  choferes.each do | chofer |
	  	  if @documento == 1 # libreta de chofer
	  			dias = chofer.get_dias_que_faltan_para_vencimiento_libreta_chofer(Date.today)
	  			if dias < @dias
	  				if dias < 0
	  					dias = 'VENCIDA'
	  				end
		  			linea = LineaVencimientoDocumentacionChoferes.new
			  	  linea.cedula = chofer.get_cedula
			  	  linea.nombre = chofer.get_nombre_completo
			  	  linea.vencimiento = chofer.get_fecha_vencimiento_libreta_chofer
			  	  linea.dias = dias
			  	  @lineas_reporte << linea	
		  	  end
	  	  end # documento 1

	  		if @documento == 2 # cedula
	  			dias = chofer.get_dias_que_faltan_para_vencimiento_cedula(Date.today)

					puts('---------------------------------------------------------------')
					puts('Param: ' + @dias.to_s, + ' DIAS: ' + dias.to_s)

	  			if dias < @dias
	  				if dias < 0
	  					dias = 'VENCIDA'
	  				end
		  			linea = LineaVencimientoDocumentacionChoferes.new
			  	  linea.cedula = chofer.get_cedula
			  	  linea.nombre = chofer.get_nombre_completo
			  	  linea.vencimiento = chofer.get_fecha_vencimiento_cedula
			  	  linea.dias = dias
			  	  @lineas_reporte << linea	
		  	  end
	  		end # documento 2

	  		if @documento == 3 # carne de salud
	  			dias = chofer.get_dias_que_faltan_para_vencimiento_carne_salud(Date.today)
	  			if dias < @dias
	  				if dias < 0
	  					dias = 'VENCIDO'
	  				end
		  			linea = LineaVencimientoDocumentacionChoferes.new
			  	  linea.cedula = chofer.get_cedula
			  	  linea.nombre = chofer.get_nombre_completo
			  	  linea.vencimiento = chofer.get_fecha_vencimiento_carne_salud
			  	  linea.dias = dias
			  	  @lineas_reporte << linea	
		  	  end # dias < @dias
	  		end # documento 3	  	  
	  	end # iteracion choferes
    end	 # dias > 0

		puts(@lineas_reporte.to_json)

	end	# index
end # class