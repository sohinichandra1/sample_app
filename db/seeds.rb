# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times.each do |i|
  attr = { email: "test#{i+1}@test.com", first_name: "User#{i+1}", password: "123456", password_confirmation: "123456", username: "test#{i + 1}" }
  User.create(attr)
end

user = User.first
user.friends << User.where("id <> ?", user.id).limit(4)
user.save

user = User.where(email: "test2@test.com").first
user.friends << User.where("id <> ?", user.id).limit(4)
user.save
