class AddCarneSaludToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :carne_salud, :string
  end
end
