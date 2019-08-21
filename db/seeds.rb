# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# #   Character.create(name: 'Luke', movie: movies.first)

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
OnboardingAnswer.destroy_all
OnboardingQuestion.destroy_all
EndangeredStatus.destroy_all

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

puts "Created EndangeredStatus"

endangered_status_attributes = [
  {
    abbreviation: "EX",
    status: "Extinct",
  },
  {
    abbreviation: "Ew",
    status: "Extinct in the Wild",
  },
  {
    abbreviation: "CR",
    status: "Critically Endangered",
  },
  {
    abbreviation: "EN",
    status: "Endangered",
  },
  {
    abbreviation: "VU",
    status: "Vulnerable",
  },
  {
    abbreviation: "NT",
    status: "Near Threatened",
  },
  {
    abbreviation: "LC",
    status: "Least Concern",
  },
  {
    abbreviation: "DD",
    status: "Data Deficient",
  },
   {
    abbreviation: "NE",
    status: "Not Evaluated",
  },
]

endangered_status_attributes.each do |status|
  EndangeredStatus.create(status)
end

puts "Finished creating Endangered Status"

puts "Creating Fishes"

API_TOKEN = ENV['IUCN_API_TOKEN']

def calling_api(red_list_id)
  fish = JSON.parse(open("https://apiv3.iucnredlist.org/api/v3/species/id/#{red_list_id}?token=#{API_TOKEN}").read)
  endangered_status_abbr = fish["result"].first["category"]
  return EndangeredStatus.find_by(abbreviation: endangered_status_abbr).id
end

fish_attributes = [
  {
    breed: "White's Seahorse",
    location: "Pacific"  ,
    fish_avatar: "https://image.flaticon.com/icons/svg/991/991819.svg" ,
    min_score: 0,
    max_age: 10,
    red_list_id: 10088,
    endangered_status_id: calling_api(10088),
  },
    {
    breed: "Clown Fish",
    location: "Great Barrier Reef"  ,
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998605.svg" ,
    min_score: 0,
    max_age: 8,
    red_list_id: 188372,
    endangered_status_id: calling_api(188372),
  },
    {
    breed: "Puffer Fish",
    location: "Great Barrier Reef"  ,
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998763.svg" ,
    min_score: 100,
    max_age: 10,
    red_list_id: 193612,
    endangered_status_id: calling_api(193612),
  },
   {
    breed: "Atlantic Bluefin Tuna" ,
    location: "Atlantic",
    fish_avatar: "https://image.flaticon.com/icons/svg/1728/1728782.svg" ,
    min_score: 100,
    max_age: 50,
    red_list_id: 21860,
    endangered_status_id: calling_api(21860),
  },

  {
    breed: "Green Turtle",
    location: "Caribean Sea"  ,
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998805.svg" ,
    min_score: 500,
    max_age: 90,
    red_list_id: 4615,
    endangered_status_id: calling_api(4615),
  },
  {
    breed: "White Shark",
    location: "Pacific"  ,
    fish_avatar: "https://image.flaticon.com/icons/svg/1998/1998785.svg" ,
    min_score: 500,
    max_age: 100,
    red_list_id: 3855,
    endangered_status_id: calling_api(3855),
  },
]

fish_attributes.each do |fish|
  new_fish = Fish.new(fish)
  new_fish.save!
  puts "Fish created"
end

puts "Fishes done"


GameChallenge.delete_all
MyFish.delete_all
MyFish.create({
  user_id: 2,
 fish_id: 14,
 name: "Sushi",
 start_date: DateTime.now - 14,
 score_health: 95,
 score_happiness: 4.5,
 alive: true,
 age: 9
})





