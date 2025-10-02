class AddTurnoToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :turno, :integer
    add_column :boletas, :comision, :decimal
    add_column :boletas, :combustible, :decimal
    add_column :boletas, :aceite, :decimal
    add_column :boletas, :gomeria, :decimal
    add_column :boletas, :lavados, :decimal
    add_column :boletas, :otros, :decimal
    add_column :boletas, :detalle_otros, :string
    add_column :boletas, :aportes, :decimal
    add_column :boletas, :subtotal, :decimal
    add_column :boletas, :ganancia, :decimal
    add_column :boletas, :kmts, :integer
  end
end
