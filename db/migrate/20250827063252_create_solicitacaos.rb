class CreateSolicitacaos < ActiveRecord::Migration[8.0]
  def change
    create_table :solicitacoes do |t|
      t.string :mensagem
      t.date :data_visita_proposta
      t.decimal :preco_proposto
      t.string :status
      
      t.references :imovel, null: false, foreign_key: true
      t.references :cliente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
