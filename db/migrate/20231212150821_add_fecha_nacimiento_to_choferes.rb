class AddFechaNacimientoToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :fecha_nacimiento, :date
  end
end
