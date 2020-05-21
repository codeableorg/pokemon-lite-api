class Trainer < ApplicationRecord
    has_and_belongs_to_many :pokemons 
    validates :name, presence: true, uniqueness: true
    validates :genre, presence: true
    validates :wins, :losses, numericality: {greater_than_or_equal_to: 0}
end
