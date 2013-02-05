namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(user_name: "Example User",
                 user_email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(user_name: name,
                   user_email: email,
                   password: password,
                   password_confirmation: password)
    end
    users = User.all(limit: 6)
    50.times do
      review = Faker::Lorem.sentence(5)
      users.each { |user| user.reviews.create!(:review => review) }
    end
  end
end