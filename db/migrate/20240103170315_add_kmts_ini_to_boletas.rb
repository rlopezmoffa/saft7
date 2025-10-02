class AddKmtsIniToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :kmts_ini, :integer
    add_column :boletas, :kmts_fin, :integer
  end
end
