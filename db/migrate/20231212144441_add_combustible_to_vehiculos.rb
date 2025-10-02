class AddCombustibleToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :combustible, :string
  end
end
