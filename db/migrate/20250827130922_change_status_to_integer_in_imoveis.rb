class ChangeStatusToIntegerInImoveis < ActiveRecord::Migration[7.0]
  def change
    remove_column :imoveis, :status

    add_column :imoveis, :status, :integer, default: 0, null: false
  end
end