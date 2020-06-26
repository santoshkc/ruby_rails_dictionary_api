require 'test_helper'

class DictionaryControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get dictionary_search_url
    assert_response :success
  end

end
