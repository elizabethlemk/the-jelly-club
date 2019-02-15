class Like < ApplicationRecord
  
# Model Relationships
  belongs_to :sandwich
  belongs_to :user
end
