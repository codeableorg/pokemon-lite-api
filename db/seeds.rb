# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'

file = CSV.read('./db/pokemon-lite-api.csv', headers: true, converters: :all)
trainers = []
pokes = []
trainer_poke = []

file.each do |item|
  trainers.push({
    name: item['t_name'], 
    gender: item['t_gender'], 
    home_region: item['t_region'],
    team_member: item['t_team_member'], 
    wins: item['wins'],
    losses: item['losses']
  })
  pokes.push({
    name: item['name'],
    base_experience: item['base_exp'],
    main_type: item['main_type'],
    main_ability: item['main_hability']
  })
end
trainers.uniq! {|e| e[:name] }
pokes.uniq! {|e| e[:name] }
Trainer.create(trainers)
Pokemon.create(pokes)

file.each do |item|
  trainer_poke.push({
    trainer: Trainer.find_by(name: item['t_name']),
    pokemon: Pokemon.find_by(name: item['name']),
  })
end

TrainerPokemon.create(trainer_poke)