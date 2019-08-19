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
GameChallenge.destroy_all
Challenge.destroy_all
ChallengeType.destroy_all
ChallengeCategory.destroy_all
MyFish.destroy_all
Fish.destroy_all
User.destroy_all
Level.destroy_all



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
    repeatable: value['repeatable'],
    score_health: value['score_health'],
    score_happiness: value['score_happiness'].to_f,
    challenge_type: challenge_types[value['challenge_type_slug']],
    challenge_category: challenge_categories[value['challenge_category_slug']]
  )
  puts challenges[value['slug']].score_happiness
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

puts "Start creating onboarding questions"

onboarding_questions = {}
seed_file['onboarding_questions'].each do |key, value|
  puts "creating onboarding questions!"
  onboarding_questions[value['slug']] = OnboardingQuestion.create!(
    question: value['question']
    )
end

seed_file['onboarding_answers'].each do |key, value|
  puts "creating onboarding answers"
  OnboardingAnswer.create!(
    answer: value['answer'],
    score: value['score'],
    onboarding_question: onboarding_questions[value['question_slug']]
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
    breed: "White's Seahorse",
    location: "Pacific"  ,
    endangered_status:"Endangered",
    fish_avatar: "https://image.flaticon.com/icons/svg/991/991819.svg" ,
    min_score: 0,
    max_age: 10,
  },
    {
    breed: "Clown Fish",
    location: "Great Barrier Reef"  ,
    endangered_status:"Endangered",
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998605.svg" ,
    min_score: 0,
    max_age: 8,
  },
    {
    breed: "Puffer Fish",
    location: "Great Barrier Reef"  ,
    endangered_status:"Vulnerable",
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998763.svg" ,
    min_score: 100,
    max_age: 10,
  },
   {
    breed: "Atlantic Bluefin Tuna" ,
    location: "Atlantic",
    endangered_status: "Endangered" ,
    fish_avatar: "https://image.flaticon.com/icons/svg/1728/1728782.svg" ,
    min_score: 100,
    max_age: 50,
  },

  {
    breed: "Green Turtle",
    location: "Caribean Sea"  ,
    endangered_status:"Endangered",
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998805.svg" ,
    min_score: 500,
    max_age: 90,
  },
  {
    breed: "White Shark",
    location: "Pacific"  ,
    endangered_status:"Vulnerable",
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998785.svg" ,
    min_score: 500,
    max_age: 100,
  }
]

fish_attributes.each do |fish|
  Fish.create(fish)
end

puts "Fishes done"
