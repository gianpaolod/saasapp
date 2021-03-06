# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# Plans
Plan.create(name: 'basic', price: 0)
Plan.create(name: 'pro', price: 10)

# Users
10.times do |n|
  email = "test#{n+1}@example.com"
  password = "password"
  plan_id = 1 + rand(2)
  User.create!(email: email, password: password, plan_id: plan_id)
end

# Profiles
10.times do |n|

  user_id = n+1
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  avatar = Faker::Avatar.image
  job_title = ['Developer', 'Entrepreneur', 'Investor'].sample
  phone_number = Faker::PhoneNumber.phone_number
  contact_email = Faker::Internet.email
  description = Faker::DrWho.quote
  
  Profile.create!(user_id: user_id, first_name: first_name, last_name: last_name, avatar: avatar, job_title: job_title, phone_number: phone_number, contact_email: contact_email, description: description )
  
end

# Microposts
users = User.order(:created_at).take(10)
50.times do
  content = Faker::ChuckNorris.fact
  users.each { |user| user.microposts.create!(content: content) }
end

# Following relationship
user = User.all
user = users.first
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
