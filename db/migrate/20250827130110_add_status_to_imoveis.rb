class AddStatusToImoveis < ActiveRecord::Migration[8.0]
  def change
    add_column :imoveis, :status, :string, default: "disponível"
  end
end
