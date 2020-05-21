class Trainer < ApplicationRecord
  has_and_belongs_to_many :pokemons
  attr_default :status, false
  attr_default :losses, 0
  attr_default :wins, 0
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :region, presence: true
end
