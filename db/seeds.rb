# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "Cleaning data base..."
Answer.destroy_all
Question.destroy_all
ChallengeType.destroy_all
ChallengeCategory.destroy_all
Level.destroy_all
Fish.destroy_all
Challenge.destroy_all

puts "Creating Challenge Types"

ChallengeType.create(name: "Quizz")
ChallengeType.create(name: "Others")

puts "Challenge Types complete"

puts "Creating Challenge Categories"

ChallengeCategory.create(name: "Global Warming")
ChallengeCategory.create(name: "Pollution")
ChallengeCategory.create(name: "Overfishing")

puts "Challenge Categories done"

puts "Creating Levels"

level_attributes = [
  {
    name: "Ocean Newbie",
    min_score: 0,
  },
    {
    name: "Bronze Ocean Warrior",
    min_score: 100,
  },
    {
    name: "Silver Ocean Warrior",
    min_score: 500,
  },
    {
    name: "Gold Ocean Warrior",
    min_score: 1000,
  },
   {
    name: "Ocean Ninja",
    min_score: 2500,
  },
  {
    name: "Ocean Master",
    min_score: 10000,
  },
]

level_attributes.each do |level|
  Level.create(level)
end

puts "Levels done"

puts "Creating Fishes"

fish_attributes = [
  {
    breed: "Atlantic Bluefin Tuna" ,
    location: "Atlantic",
    endangered_status: "Endangered" ,
    fish_avatar: "https://image.flaticon.com/icons/svg/1728/1728782.svg" ,
    min_score: 0,
    max_age: 50,
  },
    {
    breed: "White's Seahorse",
    location: "Pacific"  ,
    endangered_status:"Endangered",
    fish_avatar: "https://image.flaticon.com/icons/svg/1997/1997024.svg" ,
    min_score: 0,
    max_age: 10,
  }
]

fish_attributes.each do |fish|
  Fish.create(fish)
end

puts "Fishes done"
