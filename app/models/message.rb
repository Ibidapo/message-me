class Message < ApplicationRecord
  validates :body, presence: true
  validates :sender_id, presence: true
  validates :recipient_id, presence: true

  belongs_to :sender, class_name: "User", foreign_key: :sender_id
  belongs_to :recipient, class_name: "User", foreign_key: :recipient_id
end
