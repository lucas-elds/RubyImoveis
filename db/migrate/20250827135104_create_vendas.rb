class CreateVendas < ActiveRecord::Migration[8.0]
  def change
    create_table :vendas do |t|
      t.date :data
      t.decimal :valor
      t.references :corretor, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true
      t.references :imovel, null: false, foreign_key: true

      t.timestamps
    end
  end
end
