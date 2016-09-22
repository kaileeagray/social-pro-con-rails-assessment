User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true)

User.create!(name:  "Kailee Gray",
            email: "kaileeagray@gmail.com",
            password:              "foobar",
            password_confirmation: "foobar",
            admin: true)

5.times do |n|
  name = Faker::Book.author
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)

15.times do
  title = Faker::Beer.name
  description = Faker::ChuckNorris.fact
  users.each do |user|
    user.lists.create!(title: title, description: description)
  end
end

20.times do
  title = Faker::Book.title
  description = Faker::Hacker.say_something_smart
  users.each do |user|
    user.lists.create!(title: title, description: description)
  end
end

users = User.all
lists = List.all

user = User.first
list = List.first

starred = lists[3..25]
starrers = users

starred.each { |l| user.star(l) }
starrers.each { |u| u.star(list)}
