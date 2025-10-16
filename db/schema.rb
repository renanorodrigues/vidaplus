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

ActiveRecord::Schema[8.0].define(version: 2025_09_29_103111) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "administradores", force: :cascade do |t|
    t.string "nome_completo"
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
    t.integer "estado", default: 0
    t.bigint "profissional_id", null: false
    t.bigint "unidade_medica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profissional_id"], name: "index_agendas_on_profissional_id"
    t.index ["unidade_medica_id"], name: "index_agendas_on_unidade_medica_id"
  end

  create_table "consultas", force: :cascade do |t|
    t.string "observacao"
    t.datetime "data_marcacao"
    t.integer "estado", default: 0
    t.integer "tipo_consulta"
    t.bigint "paciente_id", null: false
    t.bigint "profissional_id", null: false
    t.bigint "unidade_medica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_consultas_on_paciente_id"
    t.index ["profissional_id"], name: "index_consultas_on_profissional_id"
    t.index ["unidade_medica_id"], name: "index_consultas_on_unidade_medica_id"
  end

  create_table "pacientes", force: :cascade do |t|
    t.string "nome_completo"
    t.string "sexo"
    t.string "idade"
    t.json "endereco"
    t.string "rg"
    t.string "cpf"
    t.string "contato"
    t.string "contato_emergencia"
    t.text "observacao"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_pacientes_on_usuario_id"
  end

  create_table "profissionais", force: :cascade do |t|
    t.string "nome_completo"
    t.string "contato"
    t.string "email_profissional"
    t.text "biografia"
    t.integer "ocupacao"
    t.json "especialidades_medicas"
    t.bigint "usuario_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["usuario_id"], name: "index_profissionais_on_usuario_id"
  end

  create_table "profissional_unidade_medicas", force: :cascade do |t|
    t.bigint "profissional_id", null: false
    t.bigint "unidade_medica_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profissional_id"], name: "index_profissional_unidade_medicas_on_profissional_id"
    t.index ["unidade_medica_id"], name: "index_profissional_unidade_medicas_on_unidade_medica_id"
  end

  create_table "prontuarios", force: :cascade do |t|
    t.json "historico_clinico"
    t.text "observacao"
    t.bigint "paciente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_prontuarios_on_paciente_id"
  end

  create_table "receitas", force: :cascade do |t|
    t.json "prescricao"
    t.text "observacao"
    t.bigint "profissional_id", null: false
    t.bigint "paciente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["paciente_id"], name: "index_receitas_on_paciente_id"
    t.index ["profissional_id"], name: "index_receitas_on_profissional_id"
  end

  create_table "relatorios", force: :cascade do |t|
    t.integer "tipo"
    t.string "assunto"
    t.text "conteudo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "unidade_medicas", force: :cascade do |t|
    t.string "nome_fantasia"
    t.string "cnpj"
    t.json "endereco"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "estado", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "versions", force: :cascade do |t|
    t.string "whodunnit"
    t.datetime "created_at"
    t.bigint "item_id", null: false
    t.string "item_type", null: false
    t.string "event", null: false
    t.text "object"
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "administradores", "usuarios"
  add_foreign_key "agendas", "profissionais"
  add_foreign_key "agendas", "unidade_medicas"
  add_foreign_key "consultas", "pacientes"
  add_foreign_key "consultas", "profissionais"
  add_foreign_key "consultas", "unidade_medicas"
  add_foreign_key "pacientes", "usuarios"
  add_foreign_key "profissionais", "usuarios"
  add_foreign_key "profissional_unidade_medicas", "profissionais"
  add_foreign_key "profissional_unidade_medicas", "unidade_medicas"
  add_foreign_key "prontuarios", "pacientes"
  add_foreign_key "receitas", "pacientes"
  add_foreign_key "receitas", "profissionais"
end
