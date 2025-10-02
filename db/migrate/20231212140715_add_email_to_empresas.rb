class AddEmailToEmpresas < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :email, :string
  end
end
