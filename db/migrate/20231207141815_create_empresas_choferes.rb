class CreateEmpresasChoferes < ActiveRecord::Migration[7.0]
  def change
    create_table :empresas_choferes do |t|
      t.integer :empresa_id
      t.integer :chofer_id
      t.date :fecha_alta

      t.timestamps
    end
  end
end
