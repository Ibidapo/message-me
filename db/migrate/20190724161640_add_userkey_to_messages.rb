class AddUserkeyToMessages < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :messages, :users, column: :sender_id
    add_foreign_key :messages, :users, column: :recipient_id
  end
end
