# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Database'
u = User.create(email: 'asdf@asdf.com', password: 'asdfasdf')
l = Location.create(name: 'A1', capacity: 500)
c = Container.create(name: 'Liner 50', capacity: 50)
v = Variety.create(name: 'Sunflower', price: 100, container: c)
Batch.create(variety: v, location: l, quantity: 50, user: u, container: c)

puts('Some basic seeds created')