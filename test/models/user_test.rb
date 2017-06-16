require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name combines first and last names" do
    user = User.new(first_name: 'Foo', last_name: 'Bar')

    assert_equal(user.name, 'Foo Bar')
  end
end
