# frozen_string_literal: true

class Trainer < ApplicationRecord
  has_and_belongs_to_many :pokemons
  validates :t_team_member, inclusion: { in: [true, false] }
  validates :t_name, :t_gender, presence: true
  validates :t_name, uniqueness: true
  validates :wins, :losses, numericality: { greater_than_or_equal_to: 0 }
end
