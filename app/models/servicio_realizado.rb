class ServicioRealizado < ApplicationRecord
  def get_vehiculo 
    vehiculo = Vehiculo.where('id = ?', self.vehiculo_id).first
    return vehiculo.present? ? vehiculo.matricula : nil
  end

  def get_item 
    item = ItemMantenimiento.where('id = ?', self.item_id).first
    return item.present? ? item.nombre : nil
  end

end
