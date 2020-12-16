require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test 'adding and searching record' do 
    Room.create :name => 'NewRoom'
    res = Room.find_by(name: 'NewRoom')
    assert_equal 'NewRoom', res.name
  end

end
