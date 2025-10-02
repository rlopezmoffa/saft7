class AddTicketToBoletas < ActiveRecord::Migration[7.0]
  def change
    add_column :boletas, :ticket, :integer
  end
end
