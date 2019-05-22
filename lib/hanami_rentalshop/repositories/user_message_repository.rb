class UserMessageRepository < Hanami::Repository
  associations do
    belongs_to :chat_room
  end
end
