class CreateTrainerPokemon < ActiveRecord::Migration[6.0]
  def change
    create_table :trainers_pokemons do |t|
      t.references :pokemon, null: false, foreign_key: true
      t.references :trainer, null: false, foreign_key: true
    end
  end
end
