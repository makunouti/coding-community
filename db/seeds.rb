# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
20.times do |n|
  User.create!(
    name: "てすと#{n+1}郎",
    email: "email#{n+1}@email",
    password: "aaaaaa"
    )
  end

20.times do |n|
  Question.create!(
    user_id: "#{n+1}",
    title: "てすと#{n+1}",
    body: "質問内容#{n+1}"
    )
  end

tags = [
  "ruby",
  "HTML",
  "CSS",
  "Ruby on Rails"
  ]

tags.each do |tag|
  Tag.create!(
    name: tag
  )
end

20.times do |n|
  QuestionTagRelation.create!(
    question_id: Question.all.sample,
    tag_id: Tag.all.sample
    )
end

# 20.times do |n|
#   q_id = Question.all.sample # 1 or 5 or 100000
#   4.times do |j|
#     QuestionTagRelation.create!(
#       question_id: q_id,
#       tag_id: Tag.all.sample
#     )
#   end
# end