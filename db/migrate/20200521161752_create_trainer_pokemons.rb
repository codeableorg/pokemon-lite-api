class CreateTrainerPokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :trainer_pokemons do |t|
      t.references :trainer, null: false, foreign_key: true
      t.references :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
