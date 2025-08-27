class RenameCorretorsToCorretores < ActiveRecord::Migration[8.0]
  def change
    rename_table :corretors, :corretores
  end
end
