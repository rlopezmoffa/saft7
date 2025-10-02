class AddVencimientoCedulaToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :vencimiento_cedula, :date
  end
end
