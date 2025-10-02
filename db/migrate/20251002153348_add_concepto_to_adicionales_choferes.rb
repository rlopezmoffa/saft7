class AddConceptoToAdicionalesChoferes < ActiveRecord::Migration[7.0]
  def change
    add_column :adicionales_choferes, :concepto, :string
  end
end
