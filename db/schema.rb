# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2025_10_02_153348) do
  create_table "adicionales_choferes", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "fecha"
    t.decimal "gastos", precision: 10, default: "0"
    t.decimal "ingresos", precision: 10, default: "0"
    t.integer "chofer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "concepto"
  end

  create_table "adicionales_vehiculos", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "fecha"
    t.decimal "gastos", precision: 10, default: "0"
    t.decimal "ingresos", precision: 10, default: "0"
    t.integer "vehiculo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "concepto"
  end

  create_table "administraciones", charset: "utf8mb3", force: :cascade do |t|
    t.string "nombre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "boletas", charset: "utf8mb3", force: :cascade do |t|
    t.date "fecha"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "chofer_id", default: 0
    t.integer "vehiculo_id", default: 0
    t.integer "turno"
    t.decimal "comision", precision: 10, default: "0"
    t.decimal "combustible", precision: 10, default: "0"
    t.decimal "aceite", precision: 10, default: "0"
    t.decimal "gomeria", precision: 10, default: "0"
    t.decimal "lavados", precision: 10, default: "0"
    t.decimal "otros", precision: 10, default: "0"
    t.string "detalle_otros"
    t.decimal "subtotal", precision: 10
    t.decimal "ganancia", precision: 10
    t.decimal "rec_mercado_pago", precision: 10, default: "0"
    t.decimal "rec_oca_cel", precision: 10, default: "0"
    t.decimal "rec_bits", precision: 10, default: "0"
    t.decimal "rec_transferencia", precision: 10, default: "0"
    t.decimal "rec_h13", precision: 10, default: "0"
    t.decimal "rec_otros", precision: 10, default: "0"
    t.integer "administracion_id", default: 0
    t.decimal "salario", precision: 10, scale: 3
    t.decimal "pago_corporativo", precision: 10, scale: 3
    t.integer "kmts_ini"
    t.integer "kmts_fin"
    t.integer "ticket"
    t.decimal "viaticos", precision: 10, default: "0"
    t.decimal "rec_pos", precision: 10, default: "0"
    t.decimal "total_entregado", precision: 10, default: "0"
    t.decimal "total_recaudado", precision: 10, default: "0"
    t.decimal "combustible_credito", precision: 10, scale: 3, default: "0.0"
    t.decimal "aporte_manual", precision: 10, scale: 3, default: "0.0"
    t.decimal "aporte_calculado", precision: 10, scale: 3, default: "0.0"
    t.decimal "retenciones", precision: 10, scale: 3, default: "0.0"
    t.integer "tipo_liquidacion", default: 0
    t.integer "empresa_id", default: 0
    t.integer "forma_pago", default: 0
  end

  create_table "choferes", charset: "utf8mb3", force: :cascade do |t|
    t.string "codigo"
    t.string "nombre"
    t.string "apellido"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "vencimiento_libreta_chofer"
    t.date "vencimiento_carne_salud"
    t.date "vencimiento_cedula"
    t.string "cedula"
    t.string "libreta_chofer"
    t.string "carne_salud"
    t.date "fecha_nacimiento"
    t.string "domicilio"
    t.string "telefonos"
    t.string "whatsapp"
    t.string "email"
    t.string "mutualista"
    t.string "emergencia"
    t.string "contacto_tercero"
    t.string "banco"
    t.string "cuenta_banco"
    t.string "sucursal_banco"
    t.text "observaciones"
    t.integer "administracion_id", default: 0
  end

  create_table "empresas", charset: "utf8mb3", force: :cascade do |t|
    t.string "nombre"
    t.string "direccion"
    t.string "nro_bps"
    t.string "rut"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha_ingreso"
    t.boolean "flag_activa", default: true
    t.text "observaciones"
    t.string "telefonos"
    t.string "email"
    t.string "whatsapp"
    t.integer "administracion_id", default: 0
  end

  create_table "empresas_choferes", charset: "utf8mb3", force: :cascade do |t|
    t.integer "empresa_id"
    t.integer "chofer_id"
    t.date "fecha_alta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "fecha_alta_bps"
    t.decimal "porc_comision", precision: 10, scale: 3, default: "0.0"
    t.decimal "porc_aporte", precision: 10, scale: 3, default: "0.0"
    t.integer "administracion_id", default: 0
  end

  create_table "items_mantenimiento", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "nombre"
    t.integer "cambiar_dias"
    t.integer "cambiar_kmts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "liquidaciones_vehiculos", charset: "utf8mb3", force: :cascade do |t|
    t.integer "vehiculo_id"
    t.integer "mes"
    t.integer "anio"
    t.integer "dia"
    t.decimal "rec_diurna", precision: 10, default: "0"
    t.decimal "rec_nocturna", precision: 10, default: "0"
    t.decimal "comision", precision: 10, default: "0"
    t.decimal "combustible", precision: 10, default: "0"
    t.decimal "aceite", precision: 10, default: "0"
    t.decimal "gomeria", precision: 10, default: "0"
    t.decimal "lavados", precision: 10, default: "0"
    t.decimal "otros", precision: 10, default: "0"
    t.string "detalle_otros"
    t.decimal "aportes", precision: 10, default: "0"
    t.decimal "subtotal", precision: 10
    t.decimal "ganancia", precision: 10
    t.integer "kmts", default: 0
    t.decimal "valor_kmt", precision: 10
    t.integer "administracion_id", default: 0
  end

  create_table "servicios_realizados", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.date "fecha"
    t.integer "kmts"
    t.date "fecha_proximo"
    t.integer "kmts_proximo"
    t.text "observaciones"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "vehiculo_id"
    t.integer "item_id", default: 0
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "administracion_id", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vehiculos", charset: "utf8mb3", force: :cascade do |t|
    t.string "codigo"
    t.string "marca"
    t.string "modelo"
    t.string "matricula"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "empresa_id", default: 0
    t.string "seguro"
    t.string "padron"
    t.string "motor"
    t.string "chasis"
    t.string "combustible"
    t.text "observaciones"
    t.integer "administracion_id", default: 0
    t.string "movil"
  end

end
