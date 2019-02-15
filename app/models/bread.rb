class Bread < ApplicationRecord

# Model Relationships
  has_many :sandwiches
  has_many :spreads, through: :sandwiches

# Validation/Error Messages
  validates :name, presence: true, uniqueness: true
end
