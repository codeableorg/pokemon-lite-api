# frozen_string_literal: true

class Trainer < ApplicationRecord
  has_and_belongs_to_many :pokemons
  validates :name, :gender, presence: true
  validates :team_member_status, inclusion: { in: [true, false] }
  validates :name, uniqueness: true
  validates :wins, :losses, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
