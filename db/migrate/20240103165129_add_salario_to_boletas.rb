class AddSalarioToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :salario, :decimal, :precision => 10, :scale => 3
    add_column :boletas, :viatico, :decimal, :precision => 10, :scale => 3
    add_column :boletas, :pos, :decimal, :precision => 10, :scale => 3
    add_column :boletas, :pago_corporativo, :decimal, :precision => 10, :scale => 3

  end
end
