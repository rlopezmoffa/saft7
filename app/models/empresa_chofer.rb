class EmpresaChofer < ApplicationRecord
  def get_nombre_chofer
    chofer = Chofer.where('id =  ?', self.chofer_id).first
    return chofer.present? ? chofer.nombre + ' ' + chofer.apellido : nil  
  end
end
