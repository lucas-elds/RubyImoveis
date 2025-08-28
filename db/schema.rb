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

ActiveRecord::Schema[8.0].define(version: 2025_08_27_150724) do
  create_table "clientes", force: :cascade do |t|
    t.string "nome"
    t.string "cpf"
    t.string "endereco"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_clientes_on_email", unique: true
    t.index ["reset_password_token"], name: "index_clientes_on_reset_password_token", unique: true
  end

  create_table "corretores", force: :cascade do |t|
    t.string "creci"
    t.string "nome"
    t.string "cpf"
    t.string "endereco"
    t.string "telefone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_corretores_on_email", unique: true
    t.index ["reset_password_token"], name: "index_corretores_on_reset_password_token", unique: true
  end

  create_table "imoveis", force: :cascade do |t|
    t.decimal "preco"
    t.string "tamanho"
    t.integer "n_quartos"
    t.integer "n_banheiros"
    t.string "rua"
    t.string "numero"
    t.string "cidade"
    t.string "bairro"
    t.string "uf"
    t.integer "corretor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "disponível", null: false
    t.string "tipo", null: false
    t.index ["corretor_id"], name: "index_imoveis_on_corretor_id"
  end

  create_table "solicitacoes", force: :cascade do |t|
    t.string "mensagem"
    t.date "data_visita_proposta"
    t.decimal "preco_proposto"
    t.string "status", default: "Em Aberto", null: false
    t.integer "imovel_id", null: false
    t.integer "cliente_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_solicitacoes_on_cliente_id"
    t.index ["imovel_id"], name: "index_solicitacoes_on_imovel_id"
  end

  create_table "vendas", force: :cascade do |t|
    t.date "data"
    t.decimal "valor"
    t.integer "corretor_id", null: false
    t.integer "cliente_id", null: false
    t.integer "imovel_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cliente_id"], name: "index_vendas_on_cliente_id"
    t.index ["corretor_id"], name: "index_vendas_on_corretor_id"
    t.index ["imovel_id"], name: "index_vendas_on_imovel_id"
  end

  add_foreign_key "imoveis", "corretores"
  add_foreign_key "solicitacoes", "clientes"
  add_foreign_key "solicitacoes", "imoveis"
  add_foreign_key "vendas", "clientes"
  add_foreign_key "vendas", "corretores"
  add_foreign_key "vendas", "imoveis"
end
