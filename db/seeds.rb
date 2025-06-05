# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Clearing existing records..."

Application.destroy_all
Vacancy.destroy_all
BandMember.destroy_all
Instrument.destroy_all
Band.destroy_all
User.destroy_all

puts "Creating users..."

User.create!(
  email: "milo@milo.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Milo",
  last_name: "Vingoe",
  username: "milo",
  bio: "I am a musician and I love to play the guitar. I am looking for a band to join.",
  address: "New Cross, London, UK"
)

User.create!(
  email: "james@james.com",
  password: "password",
  password_confirmation: "password",
  first_name: "James",
  last_name: "Kay-Shuttleworth",
  username: "james",
  bio: "I am a drummer and I love to play the drums.",
  address: "Brixton, London, UK"
)

User.create!(
  email: "admir@admir.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Admir",
  last_name: "Kurman",
  username: "admir",
  bio: "I am a bassist and I love to play the bass.",
  address: "Maida Vale, London, UK"
)

User.create!(
  email: "jane@jane.com",
  password: "password",
  password_confirmation: "password",
  first_name: "Jane",
  last_name: "Doe",
  username: "jane",
  bio: "I am a vocalist and I love to sing.",
  address: "Earls Court, London, UK"
)

User.create!(
  email: "john@john.com",
  password: "password",
  password_confirmation: "password",
  first_name: "John",
  last_name: "Doe",
  username: "john",
  bio: "I am a keyboardist and I love to play the keyboard.",
  address: "Epsom, London, UK"
)

puts "Created #{User.count} users."


puts "Creating bands..."

band = Band.new(
  name: "The Rockers",
  address: "New Cross, London, UK",
  bio: "We are a rock band from London. We love to play rock music and we are looking for new members.",
  genre: "Rock",
  user_id: User.first.id
)
band.photo.attach(io: File.open(Rails.root.join("app/assets/images/rock_band.jpg")), filename: "rock_band.jpg", content_type: "image/jpg")

Band.create!(
  name: "The Jazzers",
  address: "Brixton, London, UK",
  bio: "We are a jazz band from London. We love to play jazz music and we are looking for new members.",
  genre: "Jazz",
  user_id: User.last.id
)

puts "Created #{Band.count} bands."

puts "Creating instruments..."

Instrument.create!(
  name: "Guitar",
  experience: 3,
  description: "I can play rock, jazz, and blues.",
  user_id: User.find_by(first_name: "Milo").id
)

Instrument.create!(
  name: "Drums",
  experience: 4,
  description: "I can play rock, jazz, and funk.",
  user_id: User.find_by(first_name: "James").id
)

Instrument.create!(
  name: "Bass",
  experience: 5,
  description: "I can play rock, jazz, and funk.",
  user_id: User.find_by(first_name: "Admir").id
)

Instrument.create!(
  name: "Vocals",
  experience: 2,
  description: "I can sing rock, pop, and jazz.",
  user_id: User.find_by(first_name: "Jane").id
)

Instrument.create!(
  name: "Keyboard",
  experience: 4,
  description: "I can play rock, jazz, and classical.",
  user_id: User.find_by(first_name: "John").id
)

puts "Created #{Instrument.count} instruments."

puts "Creating band members..."

BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "The Rockers").id,
  user_id: User.find_by(first_name: "Milo").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Milo").id).id
)

BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "The Rockers").id,
  user_id: User.find_by(first_name: "James").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "James").id).id
)

BandMember.create!(
  band_leader: false,
  band_id: Band.find_by(name: "The Rockers").id,
  user_id: User.find_by(first_name: "Admir").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "Admir").id).id
)

BandMember.create!(
  band_leader: true,
  band_id: Band.find_by(name: "The Jazzers").id,
  user_id: User.find_by(first_name: "John").id,
  instrument_id: Instrument.find_by(user_id: User.find_by(first_name: "John").id).id
)

puts "Created #{BandMember.count} band members."


puts "Creating vacancies..."

Vacancy.create!(
  instrument: "Singer",
  description: "We are looking for a vocalist to join our band. You must be able to sing rock music and have your own microphone.",
  filled: false,
  band_id: Band.first.id,
  years_of_experience: 2,
  availability: "Weekends",
  confidence: "Comfortable performing in front of an audience"
)

puts "Created #{Vacancy.count} vacancies."

puts "Creating applications..."

Application.create!(
  pitch: "I am a guitarist and I love to play rock music. I have my own equipment and I am available to rehearse.",
  user_id: User.find_by(first_name: "Jane").id,
  vacancy_id: Vacancy.first.id
)

puts "Created #{Application.count} applications."

puts "Seeding completed successfully!"
