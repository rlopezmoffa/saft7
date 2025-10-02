class AddEmailToChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :choferes, :email, :string
  end
end
