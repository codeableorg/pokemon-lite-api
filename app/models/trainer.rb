class Trainer < ApplicationRecord
  has_and_belongs_to_many :pokemons
  attr_default :team_member, false
  attr_default :losses, 0
  attr_default :wins, 0
  validates :wins, numericality: { greater_than: 0}
  validates :losses, numericality: { greater_than: 0}
  validates :name, presence: true, uniqueness: true
  validates :gender, presence: true
  validates :region, presence: true
end
