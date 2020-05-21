# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies g= Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

data = CSV.read('db/data.csv', headers: true, header_converters: :symbol)

#"t_name","t_gender","t_region","t_team_member",
# p csv.headers

data.each do |row|
  trainer = Trainer.find_or_create_by!(
    name: row[:t_name],
    gender: row[:t_gender],
    home_region: row[:t_region],
    status: row[:t_team_member],
    wins: row[:wins],
    losses: row[:losses]
  )

  pokemon = Pokemon.find_or_create_by!(
    name: row[:name],
    main_ability: row[:main_ability],
    main_type: row[:main_type],
    base_experience: row[:base_exp]
  )

  if trainer.id && pokemon.id
    trainer.pokemons << pokemon
  end

end