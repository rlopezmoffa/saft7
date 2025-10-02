class AddObservacionesToEmpresas < ActiveRecord::Migration[7.0]
  def change
    add_column :empresas, :observaciones, :text
  end
end
