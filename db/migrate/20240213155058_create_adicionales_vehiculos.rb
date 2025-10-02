class CreateAdicionalesVehiculos < ActiveRecord::Migration[7.0]
  def change
    create_table :adicionales_vehiculos do |t|
      t.date :fecha
      t.decimal :gastos, :precision => 10, default: 0  
      t.decimal :ingresos, :precision => 10, default: 0 
      t.integer :vehiculo_id

      t.timestamps
    end
  end
end
