class AddSucursalBancoToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :sucursal_banco, :string
  end
end
