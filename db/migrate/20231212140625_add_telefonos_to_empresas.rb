class AddTelefonosToEmpresas < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :telefonos, :string
  end
end
