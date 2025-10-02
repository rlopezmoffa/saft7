class AddChasisToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :chasis, :string
  end
end
