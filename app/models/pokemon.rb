class Pokemon < ApplicationRecord
  has_and_belongs_to_many :trainers
  validates :name, :main_ability, :main_type, presence: true
  validates :name, uniqueness: true
  validates :main_type, inclusion: { in: [
    'bug',
    'electric',
    'fairy',
    'fighting',
    'fire',
    'flying',
    'grass',
    'ground',
    'ice',
    'normal',
    'poison',
    'psychic',
    'rock',
    'steel',
    'water',
  ] }
end
