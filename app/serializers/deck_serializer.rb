class DeckSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :name, :color, :card_count, :gameFormat
end
