require 'test_helper'

class TerminationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @termination = terminations(:one)
  end

  test "should get index" do
    get terminations_url
    assert_response :success
  end

  test "should get new" do
    get new_termination_url
    assert_response :success
  end

  test "should create termination" do
    assert_difference('Termination.count') do
      post terminations_url, params: { termination: {  } }
    end

    assert_redirected_to termination_url(Termination.last)
  end

  test "should show termination" do
    get termination_url(@termination)
    assert_response :success
  end

  test "should get edit" do
    get edit_termination_url(@termination)
    assert_response :success
  end

  test "should update termination" do
    patch termination_url(@termination), params: { termination: {  } }
    assert_redirected_to termination_url(@termination)
  end

  test "should destroy termination" do
    assert_difference('Termination.count', -1) do
      delete termination_url(@termination)
    end

    assert_redirected_to terminations_url
  end
end
