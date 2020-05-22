class Trainer < ApplicationRecord
    has_many :pokemons , class_name: "TrainerPokemon"
    
    validates :name, presence: true, uniqueness: true
    validates :gender, presence: true
    validates :wins, :losses, numericality: {greater_than_or_equal_to: 0}
    validates :team_member_status, inclusion: {in: [true, false]}
end
