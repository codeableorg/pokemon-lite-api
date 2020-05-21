class CreatePokemons < ActiveRecord::Migration[6.0]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.string :main_ability
      t.string :main_type
      t.integer :base_exp

      t.timestamps
    end
  end
end
