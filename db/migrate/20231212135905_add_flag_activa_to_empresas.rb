class AddFlagActivaToEmpresas < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :flag_activa, :boolean, default: true
  end
end
