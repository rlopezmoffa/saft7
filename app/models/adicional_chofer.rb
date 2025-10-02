class AdicionalChofer < ApplicationRecord
  def get_chofer
    chofer = Chofer.where('id = ?', self.chofer_id).first
    return chofer.present? ? chofer.get_nombre_completo : nil
  end
end
