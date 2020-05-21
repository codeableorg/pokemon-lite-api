# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

rows = CSV.read(Rails.root.join('db', 'pokemon-lite-api.csv'), {
  headers: true,
  header_converters: :symbol,
})

rows.each do |row|
  Trainer.find_or_create_by(
    name: row[:t_name],
    gender: row[:t_gender],
    region: row[:t_region],
    team_member: row[:t_team_member],
    wins: row[:wins],
    losses: row[:losses],
  )

  Pokemon.find_or_create_by(
    name: row[:name],
    main_ability: row[:main_ability],
    main_type: row[:main_type],
    base_exp: row[:base_exp],
  )
end

rows.each do |row|
  trainer = Trainer.find_by(name: row[:t_name])
  pokemon = Pokemon.find_by(name: row[:name])

  trainer.pokemons << pokemon
end
