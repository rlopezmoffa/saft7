class AddCuentaBancoToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :cuenta_banco, :string
  end
end
