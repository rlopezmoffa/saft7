class CreateBoletas < ActiveRecord::Migration[7.0]
  def change
    create_table :boletas do |t|
      t.date :fecha

      t.timestamps
    end
  end
end
