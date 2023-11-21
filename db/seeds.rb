# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
  email: 'admin@email',
  password: 'adminpass'
)

20.times do |n|
  User.create!(
    name: "てすと#{n+1}郎",
    email: "email#{n+1}@email",
    password: "aaaaaa"
  )
end



Tag.create!([
  { name: 'HTML'},
  { name: 'CSS'},
  { name: 'JavaScript' },
  { name: 'ruby' },
  { name: 'RubyonRails' },
  { name: 'Bootstrap' },
  { name: 'Ruby on Rails' },
  { name: 'jQuery' }
])

20.times do |n|
  Question.create!(
    user_id: n+1,
    title: "てすと#{n+1}",
    body: "質問内容#{n+1}"
  )
end