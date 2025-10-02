class AddAdministracionIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :administracion_id, :integer, default: 0
  end
end
