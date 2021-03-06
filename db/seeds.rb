require 'faker'
puts "Cleaning the database..."
Answer.destroy_all
Question.destroy_all
Feedback.destroy_all
Version.destroy_all
Startup.destroy_all
Tester.destroy_all
User.destroy_all
10.times do
  puts "Creating tester..."
  user = User.create(
    email: Faker::Internet.email,
    password: 'password',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
  tester = Tester.new(
    education: EDUCATION_LEVELS.sample,
    age: rand(25..50),
    profession: PROFESSION.sample,
    nationality: NATIONALITY.sample,
    sex: SEX.sample,
    user_id: user.id
  )
  photo_url = ['https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940', 'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940'].sample
  file = URI.open(photo_url)
  tester.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  tester.save
  puts "Creating startup..."
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
  version = Version.create(
    name: Faker::Company.name,
    quantity: rand(1..10),
    startup_id: startup.id
  )
5.times do
  feedback = Feedback.create(
    tester_id: tester.id,
    version_id: version.id,
    website_ux: rand(1..5),
    website_ui: rand(1..5),
    website_design: rand(1..5),
    website_fluidity: rand(1..5),
    website_latency: rand(1..5)
  )
end
end
puts "You have #{User.count} users"
puts "You have #{Startup.count} startups"
puts "You have #{Tester.count} testers"
puts "You have #{Version.count} versions"
puts "You have #{Feedback.count} feedbacks"
puts "Done!"
