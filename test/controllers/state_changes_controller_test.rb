require "test_helper"

class StateChangesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @state_change = state_changes(:one)
  end

  test "should get index" do
    get state_changes_url
    assert_response :success
  end

  test "should get new" do
    get new_state_change_url
    assert_response :success
  end

  test "should create state_change" do
    assert_difference("StateChange.count") do
      post state_changes_url, params: { state_change: { from_state: @state_change.from_state, project_id: @state_change.project_id, to_state: @state_change.to_state, user_id: @state_change.user_id } }
    end

    assert_redirected_to state_change_url(StateChange.last)
  end

  test "should show state_change" do
    get state_change_url(@state_change)
    assert_response :success
  end

  test "should get edit" do
    get edit_state_change_url(@state_change)
    assert_response :success
  end

  test "should update state_change" do
    patch state_change_url(@state_change), params: { state_change: { from_state: @state_change.from_state, project_id: @state_change.project_id, to_state: @state_change.to_state, user_id: @state_change.user_id } }
    assert_redirected_to state_change_url(@state_change)
  end

  test "should destroy state_change" do
    assert_difference("StateChange.count", -1) do
      delete state_change_url(@state_change)
    end

    assert_redirected_to state_changes_url
  end
end
