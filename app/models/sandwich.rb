class Sandwich < ApplicationRecord
# Model Relationships
  has_many :user_feedbacks
  belongs_to :user
  has_many :users, through: :user_feedbacks
  has_many :likes, dependent: :destroy

  has_many :sandwich_spreads
  has_many :spreads, through: :sandwich_spreads
  belongs_to :bread

  has_one_attached :image, dependent: :destroy

# Validation/ Error Messages
  validates :name, presence: true, uniqueness: true

end
