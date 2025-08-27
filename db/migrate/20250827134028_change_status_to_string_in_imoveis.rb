class ChangeStatusToStringInImoveis < ActiveRecord::Migration[8.0]
  def change
    remove_column :imoveis, :status

    add_column :imoveis, :status, :string, default: "disponível", null: false
  end
end