class ChangeDecimalsEmpresasChoferes < ActiveRecord::Migration[7.0]
  def change   
    change_column :empresas_choferes, :porc_comision, :decimal, :precision => 10, :scale => 3
    change_column :empresas_choferes, :porc_aporte, :decimal, :precision => 10, :scale => 3
  end
end
