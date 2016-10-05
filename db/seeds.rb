User.create!(name:  "Kailee Gray",
             email: "kaileeagray@gmail.com",
             password:              "foobar",
             password_confirmation: "foobar")

User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar")


2.times do |n|
  name = Faker::Book.author
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all


users.each do |user|
  2.times do
    title = Faker::Book.title
    description = Faker::Hacker.say_something_smart
    user.lists.create!(title: title, description: description)
  end
  2.times do
    title = Faker::Beer.name
    description = Faker::ChuckNorris.fact
    user.lists.create!(title: title, description: description)
  end
end

lists = List.all

user = User.first
list = List.first

starred = lists[3..25]
starrers = users

starred.each { |l| user.star(l) }
starrers.each { |u| u.star(list)}

lists.each do |l|
  3.times do
    l.items.create!(user: l.user, description: Faker::Hacker.say_something_smart, weight: rand(0..10), pro_con: true)
    l.items.create!(user: l.user, description: Faker::Hacker.say_something_smart, weight: rand(0..10), pro_con: false)
  end
  2.times do
    l.items.create!(user: User.first, description: Faker::ChuckNorris.fact, weight: rand(0..10), pro_con: true)
    l.items.create!(user: User.last, description: Faker::Hipster.sentence(3), weight: rand(0..10), pro_con: false)
  end
end


User.create!(name:  "The Onion",
            email: "onion@onion.co",
            password:              "theonion",
            password_confirmation: "theonion",
            image: "http://assets3.onionstatic.com/onionstatic/onion/static/images/onion_logo.png")
