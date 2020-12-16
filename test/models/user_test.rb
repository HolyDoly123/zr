require 'test_helper'

class UserTest < ActiveSupport::TestCase

  test 'adding and searching record' do 
    User.create :username => 'NewUser', :password => '123456', :email => 'new_user@mail.ru'
    res = User.find_by(username: 'NewUser')
    assert_equal 'new_user@mail.ru', res.email
  end

  test 'adding same record' do 
    u1 = User.create :username => 'NewUser1', :password => '123456', :email => 'new_user1@mail.ru'
    u2 = User.create :username => 'NewUser1', :password => '123456', :email => 'new_user1@mail.ru'
    assert_nil u2.id
  end

end
