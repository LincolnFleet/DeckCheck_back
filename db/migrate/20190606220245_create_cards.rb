class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table  :cards do |t|
      t.string    :api_id
      t.string    :name
      t.integer   :quantity
      t.string    :colors
      t.string    :colorIdentity
      t.string    :type
      t.string    :supertypes
      t.string    :types
      t.string    :subtypes
      t.string    :manaCost
      t.integer   :cmc
      t.string    :rarity
      t.string    :set
      t.string    :loyalty
      t.integer   :power
      t.integer   :toughness
      t.text      :text
      t.string    :imageUrl
      t.text      :flavor
      t.string    :gameFormat
      t.timestamps
    end
  end
end
