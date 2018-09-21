require 'test_helper'

class CommonPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get common_page_index_url
    assert_response :success
  end

end
