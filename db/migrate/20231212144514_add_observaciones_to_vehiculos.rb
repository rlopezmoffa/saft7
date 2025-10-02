class AddObservacionesToVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :vehiculos, :observaciones, :text
  end
end
