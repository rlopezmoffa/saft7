class AddWhatsappToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :whatsapp, :string
  end
end
