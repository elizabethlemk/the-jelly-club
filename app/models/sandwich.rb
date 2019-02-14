class Sandwich < ApplicationRecord
  has_many :user_feedbacks
  belongs_to :user
  has_many :users, through: :user_feedbacks

<<<<<<< HEAD
  has_many :sandwich_spreads
  has_many :spreads, through: :sandwich_spreads
  belongs_to :bread
=======
  has_one_attached :image
>>>>>>> 5ed9e0138b8eed8c533f508cd0ee4c896d13e46f

  validates :name, presence: true, uniqueness: true

end
