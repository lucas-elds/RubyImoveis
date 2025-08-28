class AddTipoToImovel < ActiveRecord::Migration[8.0]
  def change
    add_column :imoveis, :tipo, :string
  end
end
