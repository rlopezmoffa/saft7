class AddContactoTerceroToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :contacto_tercero, :string
  end
end
