require 'test_helper'

class RoomsControllerTest < ActionDispatch::IntegrationTest

    test "should get rooms" do
        post '/users', params: { user: {:username => 'user', :password => '123456', :email => 'new_user@mail.ru'} }
        get "/rooms"
        assert_equal '/rooms', path
    end

    test "should create rooms" do
        post '/users', params: { user: {:username => 'user', :password => '123456', :email => 'new_user@mail.ru'} }
        assert_difference('Room.count') do
            post '/rooms', params: { room: {:name => 'room1'} }
        end
    end
end
