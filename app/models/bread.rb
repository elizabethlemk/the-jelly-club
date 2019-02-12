class Bread < ApplicationRecord
  has_many :sandwiches
  has_many :spreads, through: :sandwiches

  validates :name, presence: true, uniqueness: true
end
