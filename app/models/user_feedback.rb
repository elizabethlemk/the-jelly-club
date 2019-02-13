class UserFeedback < ApplicationRecord
  belongs_to :user
  belongs_to :sandwich

  ratyrate_rateable "rating"
end
