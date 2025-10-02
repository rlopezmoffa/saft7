class AddConceptoToAdicionalesVehiculos < ActiveRecord::Migration[7.0]
  def change
    add_column :adicionales_vehiculos, :concepto, :string
  end
end
