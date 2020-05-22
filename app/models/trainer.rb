class Trainer < ApplicationRecord
  has_and_belongs_to_many :pokemons
  validates :wins, numericality: { greater_than_or_equal_to: 0}
  validates :losses, numericality: { greater_than_or_equal_to: 0}
  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :region, presence: true
end
