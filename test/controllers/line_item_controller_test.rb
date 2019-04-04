require 'test_helper'

class LineItemControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get line_item_show_url
    assert_response :success
  end

end
