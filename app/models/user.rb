class User < ApplicationRecord
  has_secure_password

  has_many :sandwiches, dependent: :destroy
  has_many :user_feedbacks, dependent: :destroy


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
