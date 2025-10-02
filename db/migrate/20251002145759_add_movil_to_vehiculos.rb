class AddMovilToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :movil, :string
  end
end
