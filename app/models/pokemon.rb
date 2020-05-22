class Pokemon < ApplicationRecord
  has_and_belongs_to_many :trainers
  validates :main_type, inclusion: %w[bug electric fairy fighting fire flying grass ground ice normal poison psychic rock steel water]
  validates :name, presence: true, uniqueness: true
  validates :experience, presence: true
  validates :main_ability, presence: true
end
