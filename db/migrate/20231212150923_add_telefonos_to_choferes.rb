class AddTelefonosToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :telefonos, :string
  end
end
