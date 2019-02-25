# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.new do |user|
  user.name = 'Borja'
  user.surname = 'Cullell'
  user.exercising_request = true
  user.email = 'borja.cullell@test.com'
  user.password = 'testtest'
  user.password_confirmation = 'testtest'
  user.save
end
