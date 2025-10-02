class Vehiculo < ApplicationRecord
  def get_empresa
    empresa = Empresa.where('id = ?', self.empresa_id).first
    return empresa.present? ? empresa.nombre : nil
  end


  def get_kmts_actuales
    ultima_boleta = Boleta::get_ultima_boleta(self.id)
    @kmts_actuales = ultima_boleta.present? ? ultima_boleta.kmts_fin.to_i : 0    
  end
end

