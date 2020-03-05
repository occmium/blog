# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

print "Wait a minute!\r"

Person.destroy_all
Article.destroy_all
Comment.destroy_all

30.times do |int|
  person = Person.create!(
    password: '123',
    name: "Bot_#{int}",
    last_name: Faker::Name.last_name,
    email: "bot#{int}@example.com"
  )
  rand(10).times do |_|
    article = person.articles.build(
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph_by_chars(number: rand(50..600)),
      person_id: person.id,
      publication: true
    )
    article.save
  end
end

people = Person.all
first_person = people.first
second_person = people.second
last_person = people.last

Article.all.each do |article|
  article.comments.build(body: 'COMMENT from the FIRST bot', person_id: first_person.id).save!
  article.comments.build(body: 'COMMENT from the SECOND bot', person_id: second_person.id).save!
  article.comments.build(body: 'COMMENT from the LAST bot', person_id: last_person.id).save!
end

first_person.articles.build(
  title: 'My first draft',
  body: 'Here is the text draft. No one sees this text.',
  person_id: first_person.id,
  publication: false
).save

puts 'You have an uninhabited database with test bots!'
