class Sandwich < ApplicationRecord
  belongs_to :bread
  has_many :sandwich_spreads
  has_many :spreads, through: :sandwich_spreads
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
