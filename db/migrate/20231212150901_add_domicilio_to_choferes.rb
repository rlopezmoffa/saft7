class AddDomicilioToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :domicilio, :string
  end
end
