class Boleta < ApplicationRecord

  def get_chofer
    chofer = Chofer.where('id = ?', self.chofer_id).first
    return chofer.present? ? chofer.nombre + ' ' + chofer.apellido : nil
  end

  def get_empresa
    vehiculo = Vehiculo.where('id = ?', self.vehiculo_id).first
    empresa = Empresa.where('id = ?', vehiculo.empresa_id).first
    return empresa.present? ? empresa : nil
  end

  def get_forma_pago
    if self.forma_pago.to_i == 1 
      return 'Efectivo'
    elsif self.forma_pago.to_i == 2
      return 'Transferencia'
    end
    return nil
  end

  def get_vehiculo
    vehiculo = Vehiculo.where('id = ?', self.vehiculo_id).first
    return vehiculo.present? ? vehiculo.matricula : nil
  end  

  def get_gastos
    return self.combustible + self.combustible_credito + self.aceite + 
      self.gomeria + self.lavados + self.viaticos +  self.otros + self.retenciones
  end

  def get_tarjetas
    return self.rec_mercado_pago + self.rec_bits + self.rec_oca_cel + self.rec_transferencia +
      self.rec_h13 + rec_pos + self.rec_otros.to_f
  end

  def get_salario

    if self.salario == nil
      chofer = Chofer.where('id = ?', self.chofer_id).first
      vehiculo = Vehiculo.where('id = ?', self.vehiculo_id).first
      empresa = Empresa.find(vehiculo.empresa_id)
      empresa_chofer = EmpresaChofer.where('empresa_id = ? AND chofer_id = ?', empresa.id, chofer.id).first
      if empresa_chofer.present? 
        return (self.total_recaudado * empresa_chofer.porc_comision) / 100
      else
        return 0      
      end
    else
      return self.salario
    end

  end

  def get_aporte_calculado
    chofer = Chofer.where('id = ?', self.chofer_id).first
    vehiculo = Vehiculo.where('id = ?', self.vehiculo_id).first
    empresa = Empresa.find(vehiculo.empresa_id)
    empresa_chofer = EmpresaChofer.where('empresa_id = ? AND chofer_id = ?', empresa.id, chofer.id).first
    
    if empresa_chofer.present? 
      salario = get_salario
      porc_aporte = empresa_chofer.porc_aporte
      aporte_calculado = (salario * porc_aporte) / 100
      return aporte_calculado
    else
      return 0
    end
  end

  def get_total_aportes    
    return get_aporte_calculado + self.aporte_manual    
  end

  def get_liquido
    return total_recaudado - get_gastos - get_salario + get_total_aportes - get_tarjetas
  end

  def get_turno
    return self.turno == 1 ? 'DIURNO' : "NOCTURNO"
  end

  def get_tipo_liquidacion
    return self.tipo_liquidacion == 1 ? 'DIARIA' : "SEMANAL"
  end

  def get_diferencia 
    return self.total_entregado.to_f - get_liquido
  end

  def get_kmts_recorridos
    return self.kmts_fin.to_i - self.kmts_ini.to_i
  end

  def get_pesos_kmt
    return get_kmts_recorridos > 0 ? self.total_recaudado / get_kmts_recorridos : 0    
  end

  def self.get_ultima_boleta(vehiculo_id)
    boleta = Boleta.where('vehiculo_id = ?', vehiculo_id).order('fecha desc').first
    return boleta.present? ? boleta : nil
  end


end
