require 'test_helper'

class CatMainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cat_main_index_url
    assert_response :success
  end

end
