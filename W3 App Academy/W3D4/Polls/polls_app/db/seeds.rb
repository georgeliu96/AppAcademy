# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Poll.destroy_all 
Question.destroy_all 
AnswerChoice.destroy_all 
Response.destroy_all 

usr1 = User.create!(username: 'Bob Bilbo')
usr2 = User.create!(username: 'Shawn Mallery')
usr3 = User.create!(username: 'Terrence Malik')
usr4 = User.create!(username: 'Moshay David')
usr5 = User.create!(username: 'Cher')
usr6 = User.create!(username: 'Nick Schneider')

poll1 = Poll.create!(user_id: usr1.id, title: 'Favorite Boba Spot')
poll2 = Poll.create!(user_id: usr2.id, title: 'Favorite Films')
poll3 = Poll.create!(user_id: usr3.id, title: 'Goodest Mushroom')
poll4 = Poll.create!(user_id: usr3.id, title: 'Bestest Foodes')
poll5 = Poll.create!(user_id: usr3.id, title: 'Mostest Drunk Food')
poll6 = Poll.create!(user_id: usr4.id, title: 'Most Marvelous Maisels')

q1 = Question.create!(poll_id: poll1.id, text: "Gong Cha is better than tea bar?")
q2 = Question.create!(poll_id: poll1.id, text: "Cha time best in NYC?")
q3 = Question.create!(poll_id: poll1.id, text: "Toronto Boba best in the world?")
q4 = Question.create!(poll_id: poll2.id, text: "Usual Suspects")
q5 = Question.create!(poll_id: poll2.id, text: "A Beautiful Mind")
q6 = Question.create!(poll_id: poll3.id, text: "Best food to eat when high?")

ac1 = AnswerChoice.create!(question_id: q1.id, text: "yes")
ac2 = AnswerChoice.create!(question_id: q1.id, text: "no")
ac3 = AnswerChoice.create!(question_id: q2.id, text: "yes")
ac4 = AnswerChoice.create!(question_id: q2.id, text: "no")
ac5 = AnswerChoice.create!(question_id: q3.id, text: "yes")
ac6 = AnswerChoice.create!(question_id: q3.id, text: "no")

r1 = Response.create!(user_id: usr5.id, answer_choice_id: ac1.id)
r2 = Response.create!(user_id: usr4.id, answer_choice_id: ac2.id)
r3 = Response.create!(user_id: usr5.id, answer_choice_id: ac1.id)
r4 = Response.create!(user_id: usr2.id, answer_choice_id: ac1.id)
r5 = Response.create!(user_id: usr3.id, answer_choice_id: ac2.id)
r6 = Response.create!(user_id: usr5.id, answer_choice_id: ac1.id)