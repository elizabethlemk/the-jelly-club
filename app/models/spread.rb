class Spread < ApplicationRecord
  has_many :sandwich_spreads
  has_many :sandwiches, through: :sandwich_spreads
  has_many :breads, through: :sandwiches

  validates :name, presence: true, uniqueness: true
end
