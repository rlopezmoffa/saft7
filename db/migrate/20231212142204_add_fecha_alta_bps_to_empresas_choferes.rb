class AddFechaAltaBpsToEmpresasChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas_choferes, :fecha_alta_bps, :date
  end
end
