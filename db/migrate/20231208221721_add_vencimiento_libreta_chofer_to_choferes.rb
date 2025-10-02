class AddVencimientoLibretaChoferToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :vencimiento_libreta_chofer, :date
  end
end
