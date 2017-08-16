require 'test_helper'

class CommentControllerTest < ActionDispatch::IntegrationTest
  test "should get matter:references" do
    get comment_matter:references_url
    assert_response :success
  end

  test "should get matter_child_id:integer" do
    get comment_matter_child_id:integer_url
    assert_response :success
  end

  test "should get matter_child_type:references" do
    get comment_matter_child_type:references_url
    assert_response :success
  end

  test "should get user:references" do
    get comment_user:references_url
    assert_response :success
  end

  test "should get body:text" do
    get comment_body:text_url
    assert_response :success
  end

end
