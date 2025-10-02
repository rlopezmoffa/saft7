class AddMutualistaToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :mutualista, :string
  end
end
