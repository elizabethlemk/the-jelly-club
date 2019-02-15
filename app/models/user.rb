class User < ApplicationRecord
#For Password Encryption
  has_secure_password

# Model Relationships
  has_many :likes, dependent: :destroy
  has_many :sandwiches, dependent: :destroy
  has_many :user_feedbacks, dependent: :destroy

  has_one_attached :image, dependent: :destroy

# Validations/Error Messages
  validates :first_name, :last_name, :user_name, presence: true
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :user_name, length: { in: 6..30 }

  validates :password,:password_confirmation, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password,:password_confirmation, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => true,
                       :on => :update

end
