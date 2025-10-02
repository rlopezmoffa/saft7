class AddEmergenciaToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :emergencia, :string
  end
end
