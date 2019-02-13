class Sandwich < ApplicationRecord
  belongs_to :bread
  has_many :user_feedbacks
  has_many :sandwich_spreads
  has_many :spreads, through: :sandwich_spreads
  belongs_to :user
  has_many :users, through: :user_feedbacks

  validates :name, presence: true, uniqueness: true

  ratyrate_rateable "name"
end
