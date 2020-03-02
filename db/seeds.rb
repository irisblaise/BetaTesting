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


  photo_url = ['https://images.pexels.com/photos/1482061/pexels-photo-1482061.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/267399/pexels-photo-267399.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'].sample
  file = URI.open(photo_url)
  startup.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  startup.save

end

puts "You have #{User.count} users"
puts "You have #{Startup.count} startups"
puts "Done!"
