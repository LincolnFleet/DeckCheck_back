class AddGameFormatToDecks < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :gameFormat, :string
  end
end
