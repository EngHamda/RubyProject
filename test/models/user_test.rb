require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "valid last user" do
    assert User.last.name="abc"
  end  
end
