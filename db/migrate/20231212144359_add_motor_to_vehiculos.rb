class AddMotorToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :motor, :string
  end
end
