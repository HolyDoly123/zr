require 'test_helper'

class RoomMessagesControllerTest < ActionDispatch::IntegrationTest

    test "should create room messages" do
        post '/users', params: { user: {:username => 'user', :password => '123456', :email => 'new_user@mail.ru'} }
        post '/rooms', params: { room: {:name => 'room1'} }
        u = User.find_by_username('user')
        r = Room.find_by_name('room1')
        assert_difference('RoomMessage.count') do
            post '/room_messages', params: { room_message: {:message => 'hi', :user_id => u.id, :room_id => r.id } }
        end
        assert_equal '/room_messages', path
    end

end
