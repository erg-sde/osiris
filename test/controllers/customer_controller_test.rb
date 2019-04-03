require 'test_helper'

class CustomerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customer_index_url
    assert_response :success
  end

  test "should get show" do
    get customer_show_url
    assert_response :success
  end

  test "should get create" do
    get customer_create_url
    assert_response :success
  end

end
