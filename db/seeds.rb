# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!([
  {email: "helloherokim@gmail.com", username: "ro kim", password: "Password!23"},
  {email: "cohk21@gmail.com", username: "best boi ro", password: "Password!23"},
  {email: "test@test.com", username: "Test", password: "!Wakuwaku0"},
  {email: "glgong@sbcglobal.net", username: "mr simp", password: "Password!23"},
  {email: "joshuavillarde@gmail.com", username: "josh", password: "Password!23"}
])

Favorite.create!([
  {user_id: User.third.id, tvmaze_id: 40140},
  {user_id: User.third.id, tvmaze_id: 40143},
  {user_id: User.third.id, tvmaze_id: 56939},
  {user_id: User.third.id, tvmaze_id: 23796},
  {user_id: User.third.id, tvmaze_id: 6306},
  {user_id: User.third.id, tvmaze_id: 45590},
  {user_id: User.third.id, tvmaze_id: 42174},
  {user_id: User.third.id, tvmaze_id: 50915},
  {user_id: User.second.id, tvmaze_id: 40140},
  {user_id: User.second.id, tvmaze_id: 40143},
  {user_id: User.second.id, tvmaze_id: 56939},
  {user_id: User.second.id, tvmaze_id: 23796},
  {user_id: User.second.id, tvmaze_id: 6306},
  {user_id: User.second.id, tvmaze_id: 45590},
  {user_id: User.second.id, tvmaze_id: 42174},
  {user_id: User.second.id, tvmaze_id: 50915}
])
