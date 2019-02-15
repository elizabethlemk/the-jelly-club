class UserFeedback < ApplicationRecord
# Model Relationships
  belongs_to :user
  belongs_to :sandwich

# Validations/Error Messages
  validates :comment, presence: true, length: { minimum: 5 }

end
