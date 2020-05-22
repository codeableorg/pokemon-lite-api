# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'
puts 'seeds.rb begins here'
data = CSV.read('db/pokemon-lite-api.csv', { headers: true, header_converters: :symbol })
data.each do |row|
  pokemon = Pokemon.find_or_create_by(
    name: row[:name],
    main_ability: row[:main_ability],
    main_type: row[:main_type],
    base_experience: row[:base_exp]
  )
  trainer = Trainer.find_or_create_by(
    name: row[:t_name],
    gender: row[:t_gender],
    home_region: row[:t_region],
    team_member_status: row[:t_team_member],
    wins: row[:wins],
    losses: row[:losses]
  )

  pokemon.trainers << trainer
end
puts 'seeds.rb finishes here'
