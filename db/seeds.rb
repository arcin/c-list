# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

10.times do
  salt = BCrypt::Engine.generate_salt
  hash = BCrypt::Engine.hash_secret(Faker::Internet.password, salt)
  user = User.new(
    email: Faker::Internet.email,
    password_salt: salt,
    password_hash: hash
  )
  user.send :password=, "buffer"
  user.save!(validate: false)

  3.times do
    Post.create(
      title: Faker::Name.title,
      description: Faker::Lorem.paragraph,
      price: rand(100).to_f,
      user: user
    )
  end
end
puts "there are now #{User.count} users and #{Post.count} posts."

