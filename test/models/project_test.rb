require "test_helper"

class ProjectTest < ActiveSupport::TestCase
  test "project state defaults to planning" do
    project = Project.new
    assert_equal "planning", project.state
  end

  test "project title must be present" do
    project = projects(:one)
    project.title = nil
    assert_not project.save, "Saved the project without a title"
  end

  test "project description must be present" do
    project = projects(:one)
    project.description = nil
    assert_not project.save, "Saved the project without a description"
  end

  test "project state must be one of the valid states" do
    project = projects(:one)

    assert_raises do
      project.state = "invalid"
    end

    project.state = "planning"
    assert project.valid?, "Did not save the project with a valid state"
  end

  test "state change is saved when project state is updated" do
    project = projects(:one)
    project.planning!

    assert_difference 'StateChange.count', 1 do
      project.update(state: "in_progress", user: users(:one))
    end
  end

  test "creating a state change creates a new history item" do
    project = projects(:one)
    project.planning!

    assert_difference 'ProjectHistoryItem.count', 1 do
      project.update(state: "in_progress", user: users(:one))
    end
  end

  test "creating a new comment creates a new history item" do
    project = projects(:one)

    assert_difference 'ProjectHistoryItem.count', 1 do
      project.comments.create(content: "Test Comment", user: users(:one))
    end
  end
end
