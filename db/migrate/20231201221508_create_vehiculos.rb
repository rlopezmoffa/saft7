class CreateVehiculos < ActiveRecord::Migration[7.0]
  def change
    create_table :vehiculos do |t|
      t.string :codigo
      t.string :marca
      t.string :modelo
      t.string :matricula

      t.timestamps
    end
  end
end
