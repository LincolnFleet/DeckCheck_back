class AddFullTypeToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :full_type, :string
  end
end
