class Trainer < ApplicationRecord
  has_and_belongs_to_many :pokemons
  validates :name, :gender, presence: true
  validates :name, uniqueness: true
  validates :team_member, inclusion: { in: [true, false] }
  validates :wins, :losses, numericality: {
    greater_than_or_equal_to: 0,
  }
end
