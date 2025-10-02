class CreateServiciosRealizados < ActiveRecord::Migration[7.0]
  def change
    create_table :servicios_realizados do |t|
      t.string :item
      t.date :fecha
      t.integer :kmts
      t.date :fecha_proximo
      t.integer :kmts_proximo
      t.text :observaciones
      t.timestamps
    end
  end
end
