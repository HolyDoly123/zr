require "test_helper"

=begin
#NameError: uninitialized constant ActionCable::Connection::TestCase

class ApplicationCable::ConnectionTest < ActionCable::Connection::TestCase
  test "connects with params" do
    connect params: { user_id: 42 }
    assert_equal connection.user_id, "42"
  end

  test "rejects connection without params" do
    assert_reject_connection { connect }
  end

  test "subscribes and stream for room" do
    subscribe room: "15"
    assert subscription.confirmed?
    assert_has_stream "chat_15"
  end

end
=end