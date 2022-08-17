puts "clearing stale coffee..."
Coffee.destroy_all
Customer.destroy_all
Order.destroy_all
Coffee.reset_pk_sequence
Customer.reset_pk_sequence
Order.reset_pk_sequence

Faker::UniqueGenerator.clear

puts "seeding coffee...."
5.times { Coffee.create title: Faker::Coffee.unique.blend_name }

puts "letting in customers...."
20.times { Customer.create name: Faker::Name.unique.first_name } 

puts "taking orders...."
50.times { Order.create price: Faker::Number.between(from: 2.50, to: 8.99).round(2), customer: Customer.all.sample, coffee: Coffee.all.sample }

puts "Order Up!"