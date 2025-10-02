class CreateChoferes < ActiveRecord::Migration[7.0]
  def change
    create_table :choferes do |t|
      t.string :codigo
      t.string :nombre
      t.string :apellido

      t.timestamps
    end
  end
end
