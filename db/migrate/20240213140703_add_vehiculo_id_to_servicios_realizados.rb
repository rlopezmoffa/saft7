class AddVehiculoIdToServiciosRealizados < ActiveRecord::Migration[7.0]
  def change
    add_column :servicios_realizados, :vehiculo_id, :integer
  end
end
