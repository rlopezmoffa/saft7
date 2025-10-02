class CreateEmpresas < ActiveRecord::Migration[7.0]
  def change
    create_table :empresas do |t|
      t.string :nombre
      t.string :direccion
      t.string :nro_bps
      t.string :rut

      t.timestamps
    end
  end
end
