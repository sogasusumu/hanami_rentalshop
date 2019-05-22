class CompanyRepository < Hanami::Repository
  associations do
    has_many :clients
    has_many :chat_rooms
    has_many :client_messages, through: :chat_rooms
  end
end
