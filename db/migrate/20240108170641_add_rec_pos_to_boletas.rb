class AddRecPosToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :rec_pos, :decimal, default: 0
  end
end
