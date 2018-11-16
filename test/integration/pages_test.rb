require 'test_helper'

class PagesTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get pages_home_url
    assert_response 200
  end

  test "should get root" do
    get root_url
    assert_response 200
  end

end
