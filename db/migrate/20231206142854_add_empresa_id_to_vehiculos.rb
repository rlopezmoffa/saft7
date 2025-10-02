class AddEmpresaIdToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :empresa_id, :integer, :default => 0
  end
end
