class AddRecaudacionToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :recaudacion, :decimal, :precision => 10, :scale => 2
  end
end
