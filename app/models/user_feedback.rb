class UserFeedback < ApplicationRecord
  belongs_to :user
  belongs_to :sandwich

  validates :comment, presence: true, length: { minimum: 5 }

end
