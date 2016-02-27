require 'test_helper'

class ContentControllerTest < ActionController::TestCase

  test "home controller" do
    get :home
    assert_response :success
  end

end
