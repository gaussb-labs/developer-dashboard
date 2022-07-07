require "test_helper"

class HostTest < ActiveSupport::TestCase
  test "the truth" do
    assert true
  end

  test "should not save host without hostname" do
    host = Host.new
    assert_not host.save
  end

  test "should save host with hostname and hostIP" do
    host = Host.new
    host.hostname = "test"
    host.hostIP   = "1.1.1.1"
    assert host.save
  end

end

