class UserRepository < Hanami::Repository
  associations do
    has_many :chat_rooms
    has_many :user_messages, through: :chat_rooms
  end
end
