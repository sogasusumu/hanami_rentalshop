class ChatRoomRepository < Hanami::Repository
  associations do
    belongs_to :user
    belongs_to :company
    has_many :client_messages
    has_many :user_messages
  end

  def messages(id)
    client_messages_dataset(id).union(user_messages_dataset(id))
  end

  private

  def client_messages_dataset(id)
    client_messages.select(:body).where(chat_room_id: Integer(id))
  end

  def user_messages_dataset(id)
    user_messages.select(:body).where(chat_room_id: Integer(id))
  end
end
