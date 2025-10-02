class RemoveItemFromServiciosRealizados < ActiveRecord::Migration[7.0]
  def change
    remove_column :servicios_realizados, :item, :string
  end
end
