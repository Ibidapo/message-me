class User < ApplicationRecord
  validates :username, presence: true, length: { minimum: 3, maximum: 15 }, 
                      uniqueness: { case_sensitive: false }
  validates :interest, length: { maximum: 85 }

  has_many :sent, class_name: "Message", foreign_key: "sender_id"
  has_many :received, class_name: "Message", foreign_key: "recipient_id"

  has_many :sent_messages, through: :sent, source: :sender
  has_many :received_messages, through: :received, source: :recipient

  has_secure_password
  mount_uploader :avatar, AvatarUploader
end
