class AddVencimientoCarneSaludToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :vencimiento_carne_salud, :date
  end
end
