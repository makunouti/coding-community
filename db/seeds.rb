# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# その他顧客ユーザー
20.times do |num|
  User.create!(
    name: "name#{num + 1}",
    email: "email#{num + 1}@email",
    password: "password#{num + 1}",
    password_confirmation: "password#{num + 1}",
  )
end

20.times do |num|
  Post.create!(
    name: "name#{num + 1}",
    user_id: "id#{num + 1}",
    title: "test#{num + 1}",
    body: "test#{num + 1}",
  )
end