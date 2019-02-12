class Feedback < ApplicationRecord
  belongs_to :sandwich
  has_many :user_feedbacks
  has_many :users, through: :user_feedbacks
end
