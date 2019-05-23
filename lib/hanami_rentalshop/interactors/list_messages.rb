require 'hanami/interactor'

class ListMessages
  include Hanami::Interactor

  def call(id)
    @chat_room = ChatRoomRepository.new.messages(id)
  end
end
