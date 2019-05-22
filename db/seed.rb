company_attribute = {
    name: 'company_first'
}

company = CompanyRepository.new.create(company_attribute)

client_attributes = [
    {
        company_id: company.id,
        first_name: 'first_name_one',
        last_name: 'last_name_one',
        email: "email_one@#{company.name}.com"
    },
    {
        company_id: company.id,
        first_name: 'first_name_two',
        last_name: 'last_name_two',
        email: "email_two@#{company.name}.com"
    }
]

client_attributes.each do |client_attribute|
  ClientRepository.new.create(client_attribute)
end

user_attributes = [
    {
        first_name: 'first_name_one',
        last_name: 'last_name_one',
        email: 'email_one@email.com'
    },
    {
        first_name: 'first_name_two',
        last_name: 'last_name_two',
        email: 'email_two@email.com'
    }
]

users = user_attributes.map do |user_attribute|
  UserRepository.new.create(user_attribute)
end

users.each do |user|
  chat_room = ChatRoomRepository.new.create(company_id: company.id, user_id: user.id)
  UserMessageRepository.new.create(chat_room_id: chat_room.id, body: "i am #{user.first_name} #{user.last_name}.")
  ClientRepository.new.all.each do |client|
    ClientMessageRepository.new.create(chat_room_id: chat_room.id, client_id: client.id, body: "i am #{client.first_name} #{client.last_name}.")
  end
end
