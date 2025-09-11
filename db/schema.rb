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

ActiveRecord::Schema[8.0].define(version: 2025_09_11_212742) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "administradores", force: :cascade do |t|
    t.string "rg"
    t.string "contato"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_administradores_on_usuario_id"
  end

  create_table "agendas", force: :cascade do |t|
    t.datetime "data_inicio"
    t.datetime "data_termino"
    t.string "observacao"
    t.json "horarios"
    t.boolean "estado"
    t.bigint "profissional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profissional_id"], name: "index_agendas_on_profissional_id"
  end

  create_table "especialidade_medicas", force: :cascade do |t|
    t.string "titulo"
    t.text "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pacientes", force: :cascade do |t|
    t.bigint "usuario_id", null: false
    t.string "rg"
    t.string "cpf"
    t.string "contato"
    t.string "contato_emergencia"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_pacientes_on_usuario_id"
  end

  create_table "pedido_agendamentos", force: :cascade do |t|
    t.string "observacao"
    t.datetime "data_marcacao"
    t.boolean "estado"
    t.bigint "usuario_id", null: false
    t.bigint "profissional_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profissional_id"], name: "index_pedido_agendamentos_on_profissional_id"
    t.index ["usuario_id"], name: "index_pedido_agendamentos_on_usuario_id"
  end

  create_table "profissionais", force: :cascade do |t|
    t.string "contato"
    t.string "email_profissional"
    t.boolean "estado"
    t.text "biografia"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_profissionais_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "primeiro_nome"
    t.string "ultimo_nome"
    t.string "sexo"
    t.string "idade"
    t.json "endereco"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "administradores", "usuarios"
  add_foreign_key "agendas", "profissionais"
  add_foreign_key "pacientes", "usuarios"
  add_foreign_key "pedido_agendamentos", "profissionais"
  add_foreign_key "pedido_agendamentos", "usuarios"
  add_foreign_key "profissionais", "usuarios"
end
