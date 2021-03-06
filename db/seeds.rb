# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = :fr


#Generate users

  adjectifs= %w[petit grand maigre gros chauve musclé intelligent parfait médiocre insupportable éblouissant valeureux ringard beau gentil cool]

  2.times do

    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name
    email = "#{first_name}_#{last_name}@yopmail.com"
    description = "Je m'appelle #{first_name}, je suis #{adjectifs.sample} et mon livre préféré est #{Faker::Book.title}, je suis #{Faker::Name.title[:job].sample} à #{Faker::Address.city}."
    password = "blablabliblablou"

    User.create(first_name: first_name, last_name: last_name, description: description, email: email, password: password)

  end
    
  puts "-------------------- Users table --------------------"
  tp User.all


#Generate events

event_durations = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60]

  2.times do

    start_date = Faker::Date.between(from: Date.today, to: '2021-12-31')
    duration = event_durations.sample
    title = Faker::Hipster.word.capitalize
    description = Faker::ChuckNorris.fact
    price = Faker::Number.within(range: 1..1000)
    location = Faker::Address.city
    admin = User.all.sample

    Event.create(start_date: start_date, duration: duration, title: title, description: description, price: price, location: location, admin: admin)

  end

  puts "-------------------- Events table --------------------"
  tp Event.all


#Generate attendances

  2.times do
  Attendance.create(user: User.all.sample, event: Event.all.sample)
  end

  puts "-------------------- Attendance table --------------------"
  tp Attendance.all




