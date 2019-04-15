# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Seeding Database'
u = User.create(email: 'asdf@asdf.com', password: 'asdfasdf', name: 'Admin')
c = Container.create(name: 'Liner 50', capacity: 50)

5.times do |i|
  Location.create(name: "A#{i}", capacity: 500)
  Location.create(name: "B#{i}", capacity: 500)
  Variety.create(name: Faker::Cannabis.strain, price: [*100...500].sample, container: c)
  cu = Customer.create(name: Faker::Company.name,
                       region: Faker::Address.country)
  Order.create(customer: cu, billing_customer: cu,
               po_number: "#{cu.name[0...3].upcase}#{i}")
  3.times do
    Batch.create(variety: Variety.all.sample, location: Location.all.sample,
                 quantity: 50, user: u, stage: '1')
    LineItem.create(order: Order.all.sample, quantity: [100, 200, 300].sample,
                    variety: Variety.all.sample)
  end
end

puts('Some basic seeds created')
