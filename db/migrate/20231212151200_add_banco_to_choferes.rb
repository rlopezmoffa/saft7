class AddBancoToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :banco, :string
  end
end
