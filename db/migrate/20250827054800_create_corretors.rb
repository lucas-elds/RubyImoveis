class CreateCorretors < ActiveRecord::Migration[8.0]
  def change
    create_table :corretors do |t|
      t.string :creci
      t.string :nome
      t.string :cpf
      t.string :endereco
      t.string :telefone

      t.timestamps
    end
  end
end
