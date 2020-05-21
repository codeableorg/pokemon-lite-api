class Trainer < ApplicationRecord
  attr_default :status, false
  attr_default :losses, 0
  attr_default :wins, 0
  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :region, presence: true
end
