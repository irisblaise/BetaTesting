# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
puts "Cleaning the database..."
Startup.destroy_all
Tester.destroy_all
User.destroy_all

puts "Creating users..."
puts "Creating startups..."

10.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )

  startup = Startup.new(
    company_name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    sector: SECTOR.sample,
    url: Faker::Internet.url,
    user_id: user.id
  )
    # year: rand(2000..2020),
    # price: rand(50..500),

  # photo_url = ['https://images.unsplash.com/photo-1549317661-bd32c8ce0db2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2850&q=80', 'https://images.unsplash.com/photo-1541443131876-44b03de101c5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1350&q=80', 'https://images.unsplash.com/photo-1506671753197-8d137cc5d53c?ixlib=rb-1.2.1&auto=format&fit=crop&w=740&q=80', 'https://images.unsplash.com/photo-1502877338535-766e1452684a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1351&q=80', 'https://images.unsplash.com/photo-1489824904134-891ab64532f1?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1778&q=80'].sample
  # file = URI.open(photo_url)
  # startup.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

  startup.save
end

puts "You have #{User.count} users"
puts "You have #{Startup.count} startups"
