class AddAdministracionIdTo < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :administracion_id, :integer, default: 0
    add_column :choferes, :administracion_id, :integer, default: 0
    add_column :vehiculos, :administracion_id, :integer, default: 0
    add_column :empresas, :administracion_id, :integer, default: 0
    add_column :empresas_choferes, :administracion_id, :integer, default: 0
    add_column :liquidaciones_vehiculos, :administracion_id, :integer, default: 0
  end
end
