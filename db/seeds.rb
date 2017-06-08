# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.delete_all
User.create(email: 'team@backlog.com', password: 'geheim123', password_confirmation: 'geheim123')

UserStory.delete_all
points = [0, 1, 2, 3, 5, 8, 13, 20, 40, 100]

(1..50).to_a.each do |i|
 UserStory.create(number: format("S_%03d", i),
 title: Faker::Lorem.sentence,
 description: Faker::Lorem.paragraph,
 points: points.sample)
 end


# roles specials
#   enum role: [:admin, :team, :product_owner]
User.create(email: 'admin@backlog.com', password: 'geheim123', password_confirmation: 'geheim123', role: :admin)
User.create(email: 'po@backlog.com', password: 'geheim123', password_confirmation: 'geheim123', role: :product_owner)
User.create(email: 'chicken@backlog.com', password: 'geheim123', password_confirmation: 'geheim123', role: :chicken)
