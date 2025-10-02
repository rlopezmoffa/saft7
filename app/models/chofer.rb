class Chofer < ApplicationRecord

  def get_cedula 
    return self.cedula
  end

  def get_nombre_completo
    return self.nombre + ' ' + self.apellido
  end

  def get_fecha_vencimiento_libreta_chofer
    return self.vencimiento_libreta_chofer
  end

   def get_fecha_vencimiento_cedula
    return self.vencimiento_cedula
  end

   def get_fecha_vencimiento_carne_salud
    return self.vencimiento_carne_salud
  end

  def get_dias_que_faltan_para_vencimiento_libreta_chofer(fecha)
    if Date.valid_date?(self.vencimiento_libreta_chofer.year, self.vencimiento_libreta_chofer.month, 
        self.vencimiento_libreta_chofer.day)   
      vencimiento = Date.new(self.vencimiento_libreta_chofer.year, self.vencimiento_libreta_chofer.month, 
        self.vencimiento_libreta_chofer.day) 
      return (vencimiento - fecha).to_i      
    end
    return ''    
  end

  def get_dias_que_faltan_para_vencimiento_cedula(fecha)
    if Date.valid_date?(self.vencimiento_cedula.year, self.vencimiento_cedula.month, self.vencimiento_cedula.day)   
      vencimiento = Date.new(self.vencimiento_cedula.year, self.vencimiento_cedula.month, 
        self.vencimiento_cedula.day) 
      return (vencimiento - fecha).to_i      
    end
    return ''   
  end

  def get_dias_que_faltan_para_vencimiento_carne_salud(fecha)
    if Date.valid_date?(self.vencimiento_carne_salud.year, self.vencimiento_carne_salud.month, 
        self.vencimiento_carne_salud.day)   
      vencimiento = Date.new(self.vencimiento_carne_salud.year, self.vencimiento_carne_salud.month, 
        self.vencimiento_carne_salud.day) 
      return (vencimiento - fecha).to_i      
    end
    return ''
  end    

  def get_boletas
    boletas = Boleta.where('chofer_id = ?', self.id)
  end

end
