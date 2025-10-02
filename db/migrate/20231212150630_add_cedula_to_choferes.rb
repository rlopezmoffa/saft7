class AddCedulaToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :cedula, :string
  end
end
