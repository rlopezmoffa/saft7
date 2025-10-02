class AddPorcAporteToEmpresasChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas_choferes, :porc_aporte, :decimal, default: 0
  end
end
