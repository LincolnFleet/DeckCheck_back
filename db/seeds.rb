# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(username: 'tarvis', password: 'tarvis', avatar_img: 'https://cdn.drawception.com/images/panels/2017/6-24/dWqG1O57LE-8.png').save
Deck.new(user_id: 1, name: 'Nexus of FML', color: '{U}{G}{W}').save
Card.new(
    cmc: 7,
    colorIdentity: ["U"],
    colors: ["Blue"],
    flavor: "Sarkhan wandered into a tomb and back in time.",
    api_id: "ab6d408f-63db-57b6-9382-586cbceade42",
    imageUrl: "http://gatherer.wizards.com/Handlers/Image.ashx?multiverseid=450253&type=card",
    manaCost: "{5}{U}{U}",
    name: "Nexus of Fate",
    rarity: "Mythic",
    set: "M19",
    subtypes: [],
    supertypes: [],
    text: "Take an extra turn after this one.↵If Nexus of Fate would be put into a graveyard from anywhere, reveal Nexus of Fate and shuffle it into its owner's library instead.",
    full_type: "Instant",
    types: ["Instant"],
    deck_id: 1,
    quantity: 3
).save