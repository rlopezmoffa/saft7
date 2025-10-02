class AddFechaIngresoToEmpresas < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :fecha_ingreso, :date
  end
end
