class CreateItemsMantenimiento < ActiveRecord::Migration[7.0]
  def change
    create_table :items_mantenimiento do |t|
      t.string :nombre
      t.integer :cambiar_dias
      t.integer :cambiar_kmts

      t.timestamps
    end
  end
end
