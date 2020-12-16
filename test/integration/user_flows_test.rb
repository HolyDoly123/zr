require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest

  test "authentication" do
        get '/users/sign_in'
        assert_response :success
        post "/users/sign_in", params: { session: {
        username: users(:one).username,
        password: users(:one).password
           }
        }
   end

  test "create users" do
    post '/users', params: { user: {:username => 'user', :password => '123456', :email => 'new_user@mail.ru'} }
    res = User.find_by_username('user')
    assert_not_nil res
  end

  test "non authenticated" do
    get "/rooms/new"
    follow_redirect!
    assert_equal '/users/sign_in', path
    post "/room_messages"
    follow_redirect!
    assert_equal '/users/sign_in', path
    get "/rooms"
    follow_redirect!
    assert_equal '/users/sign_in', path
    post "/rooms"
    follow_redirect!
    assert_equal '/users/sign_in', path
  end

end

