class RemoveTypeFromCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :cards, :type, :string
  end
end
