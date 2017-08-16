require 'test_helper'

class UserAssignmentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_assignment = user_assignments(:one)
  end

  test "should get index" do
    get user_assignments_url
    assert_response :success
  end

  test "should get new" do
    get new_user_assignment_url
    assert_response :success
  end

  test "should create user_assignment" do
    assert_difference('UserAssignment.count') do
      post user_assignments_url, params: { user_assignment: { accepted: @user_assignment.accepted, assignable_id: @user_assignment.assignable_id, role: @user_assignment.role, user_id: @user_assignment.user_id } }
    end

    assert_redirected_to user_assignment_url(UserAssignment.last)
  end

  test "should show user_assignment" do
    get user_assignment_url(@user_assignment)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_assignment_url(@user_assignment)
    assert_response :success
  end

  test "should update user_assignment" do
    patch user_assignment_url(@user_assignment), params: { user_assignment: { accepted: @user_assignment.accepted, assignable_id: @user_assignment.assignable_id, role: @user_assignment.role, user_id: @user_assignment.user_id } }
    assert_redirected_to user_assignment_url(@user_assignment)
  end

  test "should destroy user_assignment" do
    assert_difference('UserAssignment.count', -1) do
      delete user_assignment_url(@user_assignment)
    end

    assert_redirected_to user_assignments_url
  end
end
