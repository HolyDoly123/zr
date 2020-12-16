require 'test_helper'

class RoomMessageTest < ActiveSupport::TestCase
  test 'adding and searching record' do 
    RoomMessage.create :message => 'NewMessage', user_id: users(:one).id, room_id: rooms(:one).id
    res = RoomMessage.find_by(message: 'NewMessage')
    assert_equal 'NewMessage', res.message
  end

  #пользователь может написать одно и то же сообщение дважды
  test 'adding same record' do 
    rm1 = RoomMessage.create :message => 'NewMessage1', user_id: users(:two).id, room_id: rooms(:two).id
    rm2 = RoomMessage.create :message => 'NewMessage1', user_id: users(:two).id, room_id: rooms(:two).id
    assert_not_nil rm2.id
  end

end
