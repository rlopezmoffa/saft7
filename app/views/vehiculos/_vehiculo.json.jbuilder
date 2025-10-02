json.extract! vehiculo, :id, :codigo, :marca, :modelo, :matricula, :created_at, :updated_at
json.url vehiculo_url(vehiculo, format: :json)
