class CreateImovels < ActiveRecord::Migration[8.0]
  def change
    create_table :imovels do |t|
      t.decimal :preco
      t.string :tamanho
      t.integer :n_quartos
      t.integer :n_banheiros
      t.string :rua
      t.string :numero
      t.string :cidade
      t.string :bairro
      t.string :uf
      t.references :corretor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
