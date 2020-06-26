require 'test_helper'
require 'dictionary_controller'

class DictionaryControllerTest < ActionDispatch::IntegrationTest

  test "should return true for word hello" do
    word = "hello"
    post "/api/word", params: { typedText: word}, as: :json
    assert_response :success

    assert_equal '/api/word', path
    assert_equal( { 'WordFound' => true, 'WordTyped' => word}, response.parsed_body )
  end

  test "test should return false for word hello1" do
    word = "hello1"
    post "/api/word", params: { typedText: word}, as: :json
    assert_response :success

    assert_equal '/api/word', path
    assert_equal( { 'WordFound' => false, 'WordTyped' => word}, response.parsed_body )
  end
end