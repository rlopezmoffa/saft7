class AddSeguroToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :seguro, :string
  end
end
