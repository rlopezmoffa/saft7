# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
ActiveSupport::Inflector.inflections(:en) do |inflect|  
  inflect.irregular "administracion", "administraciones" 
  inflect.irregular "empresa", "empresas" 
  inflect.irregular "chofer", "choferes"  
  inflect.irregular "empresa_chofer", "empresas_choferes" 
  inflect.irregular "vehiculo", "vehiculos"  
  inflect.irregular "propietario", "propietarios"  
  inflect.irregular "boleta", "boletas"  
  inflect.irregular "liquidacion_vehiculo", "liquidaciones_vehiculos"  
  inflect.irregular "servicio_realizado", "servicios_realizados"  
  inflect.irregular "item_mantenimiento", "items_mantenimiento"  
  inflect.irregular "adicional_vehiculo", "adicionales_vehiculos"  
  inflect.irregular "adicional_chofer", "adicionales_choferes"  
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym "RESTful"
# end
