class AddItemIdToServiciosRealizados < ActiveRecord::Migration[7.0]
  def change
    add_column :servicios_realizados, :item_id, :integer, default: 0
  end
end
