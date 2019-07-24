class AddUsersToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sender_id, :integer
    add_column :messages, :recipient_id, :integer
  end
end
