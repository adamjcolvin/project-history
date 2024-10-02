require "application_system_test_case"

class StateChangesTest < ApplicationSystemTestCase
  setup do
    @state_change = state_changes(:one)
  end

  test "visiting the index" do
    visit state_changes_url
    assert_selector "h1", text: "State changes"
  end

  test "should create state change" do
    visit state_changes_url
    click_on "New state change"

    fill_in "From state", with: @state_change.from_state
    fill_in "Project", with: @state_change.project_id
    fill_in "To state", with: @state_change.to_state
    fill_in "User", with: @state_change.user_id
    click_on "Create State change"

    assert_text "State change was successfully created"
    click_on "Back"
  end

  test "should update State change" do
    visit state_change_url(@state_change)
    click_on "Edit this state change", match: :first

    fill_in "From state", with: @state_change.from_state
    fill_in "Project", with: @state_change.project_id
    fill_in "To state", with: @state_change.to_state
    fill_in "User", with: @state_change.user_id
    click_on "Update State change"

    assert_text "State change was successfully updated"
    click_on "Back"
  end

  test "should destroy State change" do
    visit state_change_url(@state_change)
    click_on "Destroy this state change", match: :first

    assert_text "State change was successfully destroyed"
  end
end
