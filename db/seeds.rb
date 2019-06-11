# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.new(username: 'tarvis', password: 'tarvis', avatar_img: 'https://cdn.drawception.com/images/panels/2017/6-24/dWqG1O57LE-8.png').save
Deck.new(user_id: 1, name: 'Nexus of FML', color: '{U}{G}{W}').save