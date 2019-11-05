require 'test_helper'

class MournersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mourners_index_url
    assert_response :success
  end

  test "should get show" do
    get mourners_show_url
    assert_response :success
  end

  test "should get new" do
    get mourners_new_url
    assert_response :success
  end

  test "should get create" do
    get mourners_create_url
    assert_response :success
  end

  test "should get edit" do
    get mourners_edit_url
    assert_response :success
  end

  test "should get update" do
    get mourners_update_url
    assert_response :success
  end

end
