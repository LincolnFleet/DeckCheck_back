class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string  :user_id
      t.string  :name
      t.integer :card_count
      t.string  :color
      t.timestamps
    end
  end
end
