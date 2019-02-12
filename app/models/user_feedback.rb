class UserFeedback < ApplicationRecord
  belongs_to :user
  belongs_to :sandwich
end
