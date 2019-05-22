class ClientMessageRepository < Hanami::Repository
  associations do
    belongs_to :client
  end
end
