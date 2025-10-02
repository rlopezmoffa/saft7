class AdicionalVehiculo < ApplicationRecord
    def get_vehiculo
    vehiculo = Vehiculo.where('id = ?', self.vehiculo_id).first
    return vehiculo.present? ? vehiculo.matricula : nil
  end
end
