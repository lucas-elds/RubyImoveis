class RenameImovelsToImoveis < ActiveRecord::Migration[8.0]
  def change
    rename_table :imovels, :imoveis
  end
end
