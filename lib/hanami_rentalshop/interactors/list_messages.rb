require 'hanami/interactor'

class ListMessages
  include Hanami::Interactor

  def initialize

  end

  def call(chat_room_id)
    @chat_room = ChatRoomRepository.new.find(chat_room_id)
  end
end
