# frozen_string_literal: true

class CreateJoinTablePokemonTrainer < ActiveRecord::Migration[6.0]
  def change
    create_join_table :pokemons, :trainers do |t|
      # t.index [:pokemon_id, :trainer_id]
      # t.index [:trainer_id, :pokemon_id]
    end
  end
end
