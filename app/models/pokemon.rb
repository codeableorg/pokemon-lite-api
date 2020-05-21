class Pokemon < ApplicationRecord
  validates :main_type, inclusion: %w[bug electric fairy fighting fire flying grass ground ice normal poison psychic rock steel water]
  validates :name, presence: true
  validates :experience, presence: true
  validates :main_ability, presence: true
end
