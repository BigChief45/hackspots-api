# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  Spot.create(
    name: Faker::Company.name,
    description: 'Lorem...',
    country: Faker::Address.country,
    city: Faker::Address.city,
    address: Faker::Address.street_address,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude,
    open_hours: 'All Day',
    wifi: true,
    power: true
    )
end

# Create a test user
#User.create(email: 'test@hackspots.com', password: '12345678', password_confirmation: '12345678')

puts "Database seeding :: FINISHED"