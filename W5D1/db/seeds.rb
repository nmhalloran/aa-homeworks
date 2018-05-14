# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)ab

users = User.create([{ email: 'Timmy@troll.io', password: 'doopdeedoo'}, { email: 'Kartik@yahoo.com', password: 'mindpower'}, { email: 'Valerie@gmail.com', password: 'valerie2knows'}])

bands = Band.create([{ name: 'Rollings Stones' }, { name: 'Weird Al'}, { name: 'Dr. Dre'}, { name: 'Louis Armstrong'}])
