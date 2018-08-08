require 'test_helper'

class CustomFieldsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get custom_fields_index_url
    assert_response :success
  end

end
