class Spread < ApplicationRecord

# Model Relationships
  has_many :sandwich_spreads
  has_many :sandwiches, through: :sandwich_spreads
  has_many :breads, through: :sandwiches

# Validation/Error Messages
  validates :name, presence: true, uniqueness: true
end
