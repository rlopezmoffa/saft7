class RemoveKmtsFromBoletas < ActiveRecord::Migration[7.0]
  def change
    remove_column :boletas, :kmts, :integer
  end
end
