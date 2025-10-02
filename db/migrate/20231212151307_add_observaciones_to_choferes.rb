class AddObservacionesToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :observaciones, :text
  end
end
