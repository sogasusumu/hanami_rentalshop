class ClientRepository < Hanami::Repository
  associations do
    belongs_to :company
    has_many :client_messages
  end
end
