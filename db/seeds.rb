# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 20190812093808_create_game_fishes
# class CreateGameFishes < ActiveRecord::Migration[5.2]
#   def change
#     create_table :game_fishes do |t|
#       t.references :user, foreign_key: true
#       t.references :fish, foreign_key: true
#       t.string :name
#       t.datetime :start_date
#       t.integer :score_health
#       t.integer :score_happiness
#       t.boolean :alive

#       t.timestamps
#     end
#   end
# end



puts "Cleaning data base..."
Answer.destroy_all
Question.destroy_all
Challenge.destroy_all
ChallengeType.destroy_all
ChallengeCategory.destroy_all
Level.destroy_all
MyFish.destroy_all
Fish.destroy_all




file_path = Rails.root.join("db", "challenges.yml")
seed_file = YAML::load_file(file_path)

challenge_types = {}
seed_file['challenge_types'].each do |key, value|
  puts "creating challenge type!"
  challenge_types[value['slug']] = ChallengeType.create!(name: value['name'])
end

challenge_categories = {}
seed_file['challenge_categories'].each do |key, value|
  puts "creating challenge category!"
  challenge_categories[value['slug']] = ChallengeCategory.create!(name: value['name'], image: value['image'])
end

challenges = {}
seed_file['challenges'].each do |key, value|
  puts "creating challenge!"
  challenges[value['slug']] = Challenge.create!(
    name: value['name'],
    min_score: value['min_score'],
    duration: value['duration'],
    description: value['description'],
    score_health: value['score_health'],
    score_happiness: value['score_happiness'],
    challenge_type: challenge_types[value['challenge_type_slug']],
    challenge_category: challenge_categories[value['challenge_category_slug']]
  )
end

questions = {}
seed_file['questions'].each do |key, value|
  puts "creating questions!"
  questions[value['slug']] = Question.create!(
    content: value['content'],
    challenge: challenges[value['challenge_slug']]
    )
end

seed_file['answers'].each do |key, value|
  puts "creating answers"
  Answer.create!(
    content: value['content'],
    status: value['status'],
    question: questions[value['question_slug']]
    )
end


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
