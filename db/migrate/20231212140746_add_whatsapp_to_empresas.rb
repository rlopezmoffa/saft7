class AddWhatsappToEmpresas < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :whatsapp, :string
  end
end
