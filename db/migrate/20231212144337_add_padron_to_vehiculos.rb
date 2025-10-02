class AddPadronToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :padron, :string
  end
end
