# frozen_string_literal: true

require 'csv'
# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
data = CSV.read('db/pokemon-lite-api.csv', headers: true, header_converters: :symbol)

data.each do |row|
  row_data = row.to_h
  pokemons = %i[name base_exp main_type main_ability]
  trainers = %i[t_name t_gender t_region t_team_member wins losses]
  poke = {}
  trai = {}
  row_data.each do |k, v|
    if pokemons.include? k
      poke[k] = v
    else
      trai[k] = v
    end
  end
  Pokemon.create(poke)
  Trainer.create(trai)
end
