# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create!([
  {email: "helloherokim@gmail.com", username: "Ro", phone_number: "2246003311", password: "password"},
  {email: "cohk21@gmail.com", username: "cohk21", password: "password"}
])

favorite = Favorite.create!([
  {user_id: User.first.id, tvmaze_id: 919},
  {user_id: User.last.id, tvmaze_id: 59412}
])
